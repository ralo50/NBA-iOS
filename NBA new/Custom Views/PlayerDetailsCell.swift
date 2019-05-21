//
//  PlayerDetailsCell.swift
//  NBA new
//
//  Created by Luka on 3/29/19.
//  Copyright © 2019 Luka. All rights reserved.
//

import UIKit

class PlayerDetailsCell: UITableViewCell {
    
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel! {
        didSet {
            playerNameLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var playerPointsLabel: UILabel!
    @IBOutlet weak var playerReboundsLabel: UILabel!
    @IBOutlet weak var playerAssistsLabel: UILabel!
    @IBOutlet weak var playerFieldGoalsLabel: UILabel!
    @IBOutlet weak var playerFreeThrowsLabel: UILabel!
    @IBOutlet weak var player3PtsLabel: UILabel!
    
    
    
    func setPlayer(player: Player) {
        playerNameLabel.text = player.first_name! + " " + player.last_name!
        playerPointsLabel.text = player.points
        playerAssistsLabel.text = player.assists
        playerReboundsLabel.text = String(Int(player.rebounds_defensive!)! + Int(player.rebounds_offensive!)!)
        getPlayerImage(player: player)
    }
    
    func setName(name: String) {
        playerImageView.contentMode = .scaleAspectFit
        playerNameLabel.text = name
    }
    
    private func getPlayerImage(player: Player) {
        let url = URL(string: "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/\(player.person_id!).png")!
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                self.playerImageView.image = UIImage(data: data)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
