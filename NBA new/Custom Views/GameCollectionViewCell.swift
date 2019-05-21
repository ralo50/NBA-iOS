//
//  GameCollectionViewCell.swift
//  Nba
//
//  Created by Luka on 3/8/19.
//  Copyright © 2019 Luka. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamImageView: UIImageView!
    @IBOutlet weak var awayTeamSeasonScoreLabel: UILabel!
    @IBOutlet weak var awayTeamGameScoreLabel: UILabel!
    
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var homeTeamImageView: UIImageView!
    @IBOutlet weak var homeTeamGameScoreLabel: UILabel!
    @IBOutlet weak var homeTeamSeasonScoreLabel: UILabel!

    @IBOutlet weak var gameTimeLabel: UILabel!
    @IBOutlet weak var gameNuggetLabel: UILabel!
    
    func setGame(game: Game) {
        awayTeamImageView.contentMode = .scaleAspectFit
        homeTeamImageView.contentMode = .scaleAspectFit
        
        awayTeamImageView.image = UIImage(named: (game.awayTeamCode)?.lowercased() ?? "")
        homeTeamImageView.image = UIImage(named: (game.homeTeamCode)?.lowercased() ?? "")
        
        awayTeamNameLabel.text = game.awayTeamCode
        homeTeamNameLabel.text = game.homeTeamCode
        
        awayTeamGameScoreLabel.text = game.awayTeamGameScore
        homeTeamGameScoreLabel.text = game.homeTeamGameScore
        
        awayTeamSeasonScoreLabel.text = game.awayTeamSeasonScore
        homeTeamSeasonScoreLabel.text = game.homeTeamSeasonScore
        
        gameNuggetLabel.text = game.gameNugget
        
        gameTimeLabel.text = game.gameTime
    }
}
