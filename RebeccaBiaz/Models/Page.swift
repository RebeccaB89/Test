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
    
    enum CodingKeys: CodingKey {
        case title
        case awayScore
        case homeScore
        case videoUrl
    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.title = try container.decodeIfPresent(String.self, forKey: .title)
//        self.awayScore = try container.decodeIfPresent(Int.self, forKey: .awayScore)
//        self.homeScore = try container.decodeIfPresent(Int.self, forKey: .homeScore)
//        self.videoUrl = try container.decodeIfPresent(URL.self, forKey: .videoUrl)
//
//        print(container)
//
//    }
}
