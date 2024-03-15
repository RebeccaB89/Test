//
//  Game.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 15/03/2024.
//

import Foundation

struct Game : Codable, Identifiable, Equatable {
    
    let id: String
    let awayTeamName: String?
    let homeTeamName: String?
    let pages: [Page]?
    
    enum CodingKeys: String, CodingKey {
        case id = "gameId"
        case awayTeamName
        case homeTeamName
        case pages
    }
}
