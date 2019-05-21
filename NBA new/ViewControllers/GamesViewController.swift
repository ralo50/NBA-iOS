//
//  ViewController.swift
//  Nba
//
//  Created by Luka on 3/8/19.
//  Copyright © 2019 Luka. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ChangeDateDelegate {
    
    @IBOutlet weak var notificationLabel: UILabel! {
        didSet {
            notificationLabel.text = "Error Loading Data"
        }
    }
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.text = "Date: " + getCurrentDate(isShortFormat: false)
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var gameCollectionView: UICollectionView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    private static let SHORT_FORMAT_DATE = "yyyyMMdd"
    private static let LONG_FORMAT_DATE = "dd MMM yyyy"
    private let formatter = DateFormatter()
    private let calendar = NSCalendar.current
    private let refreshControl = UIRefreshControl()
    private var date = Date()
    private var dayChanged = Date()
    private var jsonData: URL?
    private var gamesArray: [Game] = []
    private var isGameNight = Bool()
    lazy private var dateForUrl: String = getCurrentDate(isShortFormat: true)
    private let detailsSegue = "GameDetailsSegue"
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
        setupCollectionView()
        setupGestureRecognizers()
        getGamesDetails()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gameCollectionView.reloadData()
    }
    
    
    // MARK: Initial setup
    
    private func setupRefreshControl() {
        if #available(iOS 10.0, *) {
            gameCollectionView.refreshControl = refreshControl
        } else {
            gameCollectionView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshGames(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Games Details")
    }
    
    private func setupCollectionView() {
        gameCollectionView.delegate = self
        gameCollectionView.dataSource = self
    }

    private func setupGestureRecognizers() {
        let rightSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        rightSwipeGestureRecognizer.direction =  UISwipeGestureRecognizer.Direction.right
        self.gameCollectionView.addGestureRecognizer(rightSwipeGestureRecognizer)
        
        let leftSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizer.Direction.left
        self.gameCollectionView.addGestureRecognizer(leftSwipeGestureRecognizer)
        
        leftSwipeGestureRecognizer.delegate = self as? UIGestureRecognizerDelegate
        rightSwipeGestureRecognizer.delegate = self as? UIGestureRecognizerDelegate
    }
    
    
    //MARK: Swipe Gesture Recognizers
    
    @objc func refreshGames(_ sender: Any) {
        getGamesDetails()
    }
    
    @objc func swipeLeft() {
        changeDateButtonPressed(dayChange: 1)
    }
    
    @objc func swipeRight() {
        changeDateButtonPressed(dayChange: -1)
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        return true
    }
    
    
    //MARK: CollectionView Delegate methods
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Game Cell", for: indexPath)
        if let gameCell = cell as? GameCollectionViewCell {
            gameCell.setGame(game: gamesArray[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gamesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedGame = gamesArray[indexPath.item]
        if selectedGame.isGameOver || selectedGame.isGameActive {
            performSegue(withIdentifier: self.detailsSegue, sender: selectedGame)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = gameCollectionView.bounds.size
        size.height = 200
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as! SectionHeaderVIew
        sectionHeaderView.delegate = self
        sectionHeaderView.dateLabel.text = "Date: " + getString(from: date, isShortFormat: false)
        return sectionHeaderView
    }
    
    
    //MARK: Fetch games from NBA
    
    func getGamesDetails() {
        gameCollectionView.isHidden = true
        activityIndicator.startAnimating()
        self.notificationLabel.isHidden = true
        if Reachability.isConnectedToNetwork() {
            guard let urlToExecute = URL(string: "https://data.nba.net/10s/prod/v1/" + getString(from: date, isShortFormat: true) + "/scoreboard.json") else { return }
            URLSession.shared.dataTask(with: urlToExecute) { (data, response, err ) in
                guard let data = data else { return }
                do {
                    let jsonObject = try JSONDecoder().decode(Base.self, from: data)
                    self.populateGameArray(jsonObject: jsonObject)
                    DispatchQueue.main.async {
                        self.gameCollectionView.reloadData()
                        self.refreshControl.endRefreshing()
                        self.activityIndicator.stopAnimating()
                        self.gameCollectionView.isHidden = false
                    }
                } catch let jsonErr {
                    print(jsonErr)
                }
            }.resume()
        } else {
            gameCollectionView.isHidden = true
            activityIndicator.stopAnimating()
            refreshControl.endRefreshing()
            notificationLabel.isHidden = false
        }
    }

    
    //MARK: Populate model with data
    
    private func populateGameArray(jsonObject: Base) {
        gamesArray = [Game]()
        guard let numOfGames = jsonObject.numGames else { return }
        isGameNight = numOfGames != 0
        for gameNum in 0..<numOfGames {
            var game = Game()
            game.gameId = jsonObject.games?[gameNum].gameId ?? ""
            game.gameDate = getString(from: date, isShortFormat: true)
            
            game.awayTeamGameScore = jsonObject.games?[gameNum].vTeam?.score ?? ""
            game.homeTeamGameScore = jsonObject.games?[gameNum].hTeam?.score ?? ""
            
            game.awayTeamSeasonScore = (jsonObject.games?[gameNum].vTeam?.win ?? "") + "-" + (jsonObject.games?[gameNum].vTeam?.loss ?? "")
            game.homeTeamSeasonScore = (jsonObject.games?[gameNum].hTeam?.win ?? "") + "-" + (jsonObject.games?[gameNum].hTeam?.loss ?? "")
            
            game.awayTeamCode = jsonObject.games?[gameNum].vTeam?.triCode?.uppercased() ?? ""
            game.homeTeamCode = jsonObject.games?[gameNum].hTeam?.triCode?.uppercased() ?? ""

            game.gameNugget = jsonObject.games?[gameNum].nugget?.text ?? ""

            if jsonObject.games?[gameNum].statusNum == 3 {
                game.isGameOver = true
                game.gameTime = "Final"
            } else {
                game.isGameOver = false
                game.gameTime = jsonObject.games?[gameNum].startTimeEastern ?? ""
            }
            gamesArray.append(game)
        }
    }

    
    //MARK: UI Button clicks
    
    @IBAction func dayBeforeButton(_ sender: UIButton) {
        changeDateButtonPressed(dayChange: -1)
    }
    
    @IBAction func dayAfterButton(_ sender: Any) {
        changeDateButtonPressed(dayChange: 1)
    }
    
    func changeDate(day: Int) {
        changeDateButtonPressed(dayChange: day)
    }
    
    
    //MARK: Date Utils

    private func changeDateButtonPressed(dayChange: Int) {
        dayChanged = calendar.date(byAdding: .day, value: dayChange , to: date)!
        date = dayChanged
        dateLabel.text = "Date: " + getString(from: date, isShortFormat: false)
        getGamesDetails()
    }
    
    private func getCurrentDate(isShortFormat: Bool) -> String {
        let date = Date()
        return getString(from: date, isShortFormat: isShortFormat)
    }
    
    private func getString(from date: Date, isShortFormat: Bool) -> String {
        if isShortFormat {
            formatter.dateFormat = GamesViewController.SHORT_FORMAT_DATE
        } else {
            formatter.dateFormat = GamesViewController.LONG_FORMAT_DATE
        }
        let dateString = formatter.string(from: date)
        return dateString
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.detailsSegue {
            let vc = segue.destination as! GameDetailViewController
            guard let selectedGame = sender as? Game else { return }
            vc.selectedGame = selectedGame
        }
    }
}
