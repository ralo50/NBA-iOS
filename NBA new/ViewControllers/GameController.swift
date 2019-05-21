//
//  GameController.swift
//  NBA new
//
//  Created by Luka on 4/12/19.
//  Copyright © 2019 Luka. All rights reserved.
//

import UIKit

let reuseIdentifier = "GameCell"

class GameController: UICollectionViewController {

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureComponents()
    }
    
    //MARK: - Helper Methods
    
    private func configureComponents() {
        navigationController?.navigationBar.barTintColor = .googleRed()
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "NBA Scoreboard"
        
        collectionView.register(GameCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .white
    }
}

//MARK: - GameController Delegate / DataSource

extension GameController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GameCell
        cell.backgroundColor = .red
        cell.awayImageView.image = #imageLiteral(resourceName: "phx.png")
        cell.homeImageView.image = #imageLiteral(resourceName: "was.png")
        cell.game = Game()
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

}

//MARK: - GameController FlowLayout Delegate

extension GameController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 20
        return CGSize(width: width, height: width / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 8, bottom: 8, right: 8)
    }
    
}
