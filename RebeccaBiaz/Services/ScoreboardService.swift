//
//  ScoreboardService.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 15/03/2024.
//

import Foundation

class ISO8601JSONDecoder : JSONDecoder {
    override init() {
        super.init()
        dateDecodingStrategy = .iso8601
    }
}

class ScoreboardService {
    
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = ISO8601JSONDecoder()) {
        self.decoder = decoder
    }
    
    func fetchScoreboards(from jsonFile: URL?) -> [ScoreboardCard]? {
        
        guard let jsonFile else {
            return nil
        }
        
        do {
            let jsonData = try Data(contentsOf: jsonFile)
            return self.decode(data: jsonData)
        } catch {
            return nil
        }        
    }
    
    private func decode(data: Data) -> [ScoreboardCard]? {
        
        do {
            let response = (try decoder.decode([String:[ScoreboardCard]].self, from: data))["response"]
            return response
        } catch {
            return nil
        }
    }
}
