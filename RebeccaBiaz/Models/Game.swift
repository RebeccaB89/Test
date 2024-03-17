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
    let story: Story?
    
    enum CodingKeys: String, CodingKey {
        case id = "gameId"
        case awayTeamName
        case homeTeamName
        case story = "primeStory"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.awayTeamName = try container.decodeIfPresent(String.self, forKey: .awayTeamName)
        self.homeTeamName = try container.decodeIfPresent(String.self, forKey: .homeTeamName)
        self.story = try container.decodeIfPresent(Story.self, forKey: .story)
    }
}
