//
//  GameDetailViewController.swift
//  NBA new
//
//  Created by Luka on 3/26/19.
//  Copyright © 2019 Luka. All rights reserved.
//

import Foundation
import UIKit

class GameDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var selectedGame = Game()
    lazy var currentGame = [CurrentGame]()
    lazy var homeTeamPlayersArray = [Player]()
    lazy var awayTeamPlayersArray = [Player]()
    var currentSelectedTeam = [Player]()
    let reuseIdentifier = "Cell"
    @IBOutlet weak var homeTeamImageView: UIImageView!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var awayTeamImageView: UIImageView!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    @IBOutlet weak var gameTimeLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var playersTableView: UITableView!
    @IBOutlet weak var selectedTeamLabel: UILabel! {
        didSet {
            selectedTeamLabel.text = "Select a team"
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        setupTableView()
        setupGestureRecognizers()
        getGameDetails()
    }
    
    private func setupHeader() {
        awayTeamImageView.contentMode = .scaleAspectFit
        homeTeamImageView.contentMode = .scaleAspectFit
        awayTeamImageView.image = UIImage(named: (selectedGame.awayTeamCode)?.lowercased() ?? "")
        homeTeamImageView.image = UIImage(named: (selectedGame.homeTeamCode)?.lowercased() ?? "")
        awayTeamScoreLabel.text = selectedGame.awayTeamGameScore
        homeTeamScoreLabel.text = selectedGame.homeTeamGameScore
        gameTimeLabel.text = selectedGame.gameTime
    }
    
    private func setupTableView() {
        playersTableView.delegate = self
        playersTableView.dataSource = self
    }
    
    private func setupGestureRecognizers() {
        let homeTap = UITapGestureRecognizer(target: self, action: #selector(homeTeamSelected))
        let awayTap = UITapGestureRecognizer(target: self, action: #selector(awayTeamSelected))
        
        awayTeamImageView.isUserInteractionEnabled = true
        awayTeamImageView.addGestureRecognizer(awayTap)
        
        homeTeamImageView.isUserInteractionEnabled = true
        homeTeamImageView.addGestureRecognizer(homeTap)
    }

    @objc func homeTeamSelected() {
        if currentSelectedTeam.description != homeTeamPlayersArray.description {
            currentSelectedTeam = homeTeamPlayersArray
            selectedTeamLabel.text = (currentGame[0].home?.city)! + " " + (currentGame[0].home?.nickname)!
            playersTableView.reloadData()
        }
    }
    
    @objc func awayTeamSelected() {
        if currentSelectedTeam.description != awayTeamPlayersArray.description {
            currentSelectedTeam = awayTeamPlayersArray
            selectedTeamLabel.text = (currentGame[0].visitor?.city)! + " " + (currentGame[0].visitor?.nickname)!
            playersTableView.reloadData()
        }
    }
    
    private func getGameDetails() {
        if Reachability.isConnectedToNetwork() {
            let urlString = "https://data.nba.net/json/cms/noseason/game/\(selectedGame.gameDate!)/\(selectedGame.gameId!)/boxscore.json"
            guard let urlToExecute = URL(string: urlString) else { return }
            URLSession.shared.dataTask(with: urlToExecute) { (data, response, err ) in
                guard let data = data else { return }
                do {
                    let jsonObject = try JSONDecoder().decode(BaseGame.self, from: data)
                    self.populateGameDetails(jsonObject)
                    DispatchQueue.main.async {
                        self.playersTableView.reloadData()
                    }
                } catch let jsonErr {
                    print(jsonErr)
                }
                }.resume()
        } else {
        }
    }
    
    private func populateGameDetails(_ currentGameDetails: BaseGame) {
        self.currentGame = [currentGameDetails.sports_content?.game] as! [CurrentGame]
        self.homeTeamPlayersArray = currentGameDetails.sports_content?.game?.home?.players?.player ?? [Player]()
        self.awayTeamPlayersArray = currentGameDetails.sports_content?.game?.visitor?.players?.player ?? [Player]()
    }

    
    //MARK: TableView Delegate methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentSelectedTeam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell") as! PlayerDetailsCell
        cell.setPlayer(player: currentSelectedTeam[indexPath.item])
        return cell
    }
    
}
