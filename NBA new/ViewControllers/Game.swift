//
//  File.swift
//  Nba
//
//  Created by Luka on 3/8/19.
//  Copyright © 2019 Luka. All rights reserved.
//

import Foundation

struct Game: Decodable {
    
    var gameId: String?
    var gameDate: String?
    var isGameActive: Bool = false
    var isGameOver: Bool = false
    
    var awayTeamName: String?
    var awayTeamCode: String?
    var awayTeamSeasonScore: String?
    var awayTeamGameScore: String?
    
    var homeTeamName: String?
    var homeTeamCode: String?
    var homeTeamSeasonScore: String?
    var homeTeamGameScore: String?
    
    var statusNum: Int?
    var gameTime: String?
    var gameNugget: String?
}
