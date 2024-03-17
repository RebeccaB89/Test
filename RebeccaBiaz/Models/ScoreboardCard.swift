//
//  ScoreboardCard.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 15/03/2024.
//

import Foundation

struct ScoreboardCard : Codable, Identifiable, Equatable {
    
    let id: String
    let teams: MatchCompetitors?
    let league: League?
    let fixture: Fixture?
    let game: Game?
    
    enum CodingKeys: String, CodingKey {
        case id = "WSCGameId"
        case teams
        case league
        case fixture
        case game = "wscGame"
    }
}

struct MatchCompetitors: Codable, Equatable {
    
    let away: Team?
    let home: Team?
    
    enum CodingKeys: CodingKey {
        case away
        case home
    }
}
