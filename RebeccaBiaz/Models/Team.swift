//
//  Team.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 15/03/2024.
//

import Foundation

struct Team : Codable, Identifiable, Equatable {
    
    let id: Int
    let name: String?
    let logoUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case logoUrl = "logo"
    }
}
