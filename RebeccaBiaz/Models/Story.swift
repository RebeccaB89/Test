//
//  Story.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 17/03/2024.
//

import Foundation

struct Story : Codable, Equatable, Identifiable {
    
    let id: String
    let title: String?
    let storyThumbnailSquare: URL?
    let pages: [Page]?

    enum CodingKeys: String, CodingKey {
        case id = "storyId"
        case title
        case storyThumbnailSquare
        case pages
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.storyThumbnailSquare = try container.decodeIfPresent(URL.self, forKey: .storyThumbnailSquare)
        self.pages = try container.decodeIfPresent([Page].self, forKey: .pages)
    }
}
