//
//  Page.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 15/03/2024.
//

import Foundation

struct Page : Codable, Equatable {
    
    let title: String?
    let awayScore: Int?
    let homeScore: Int?
    let videoUrl: URL?
    let gameClock: Date?
    
    enum CodingKeys: CodingKey {
        case title
        case awayScore
        case homeScore
        case videoUrl
        case gameClock
    }
}
