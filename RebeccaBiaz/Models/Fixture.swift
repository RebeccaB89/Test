//
//  Fixture.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 15/03/2024.
//

import Foundation

struct Fixture : Codable, Identifiable, Equatable {
    
    let id: Int
    let date: Date?
    let venue: Venue?
    let referee: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case venue
        case referee
    }
}
