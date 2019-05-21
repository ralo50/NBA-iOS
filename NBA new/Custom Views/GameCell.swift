//
//  GameCell.swift
//  NBA new
//
//  Created by Luka on 4/12/19.
//  Copyright © 2019 Luka. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var game: Game? {
        didSet {
            homeScoreLabel.text = game?.homeTeamGameScore
            awayScoreLabel.text = game?.awayTeamGameScore
        }
    }
    
    let homeImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let awayImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .blue
        return image
    }()
    
    let gameTimeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .blue
        return label
    }()
    
    let homeScoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .blue
        return label
    }()
    
    let awayScoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .blue
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViewComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper methods
    func configureViewComponents() {
        addSubview(awayImageView)
        awayImageView.anchor(left: leftAnchor, paddingLeft: 12, width: self.frame.width / 6, height: self.frame.width / 6)
        awayImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    
        addSubview(homeImageView)
        homeImageView.anchor(right: rightAnchor, paddingRight: 12, width: self.frame.width / 6, height: self.frame.width / 6)
        homeImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    
        addSubview(gameTimeLabel)
        gameTimeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        gameTimeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        gameTimeLabel.anchor(width: 50, height: 30)
        
        addSubview(homeScoreLabel)
        homeScoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        homeScoreLabel.anchor(right: homeImageView.leftAnchor, paddingRight: 16, width: 50, height: 30)
        
        addSubview(awayScoreLabel)
        awayScoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        awayScoreLabel.anchor(left: awayImageView.rightAnchor, paddingLeft: 16, width: 50, height: 30)
    }
}
