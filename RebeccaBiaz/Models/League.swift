//
//  League.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 15/03/2024.
//

import Foundation


struct League : Codable, Identifiable, Equatable {
    
    let id: Int
    let logoUrl: String?
    let season: Int?
    let country: String?
    let round: String?
    let flagUrl: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case logoUrl = "logo"
        case season
        case country
        case round
        case flagUrl = "flag"
        case name
    }
}
