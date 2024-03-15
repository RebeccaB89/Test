//
//  ScoreBoardViewModel.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 15/03/2024.
//

import Foundation

class ScoreBoardViewModel {
    
    private let service: ScoreboardService
    var scoreboardCards = [ScoreboardCard]()
    
    init(service: ScoreboardService = ScoreboardService(), scoreboardJsonURL: URL? = Bundle.main.url(forResource: "matchs", withExtension: "json")) {
        self.service = service
        
        fetchCards(from: scoreboardJsonURL)
    }
    
    private func fetchCards(from url: URL? = nil) {
        guard let url else {
            return
        }
        
        if let newCards = service.fetchScoreboards(from: url) {
            scoreboardCards = newCards.filter {
                return true || ($0.game != nil && $0.game?.pages?.isEmpty == false)
            }
        }
    }
}
