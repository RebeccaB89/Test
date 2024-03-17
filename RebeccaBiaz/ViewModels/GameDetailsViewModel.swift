//
//  GameDetailsViewModel.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 17/03/2024.
//

import Foundation

protocol GameDetailsViewControllerViewModel {
    var homeLogoImageUrl: URL? { get }
    var awayLogoImageUrl: URL? { get }
    
    var homeTeamName: String { get }
    var awayTeamName: String { get }
    
    var homeTeamScore: String { get }
    var awayTeamScore: String { get }
    
    var location: String { get }
}

class ScoreboardPagedDetailsViewModel : GameDetailsViewControllerViewModel {

    var scoreboardCard: ScoreboardCard
    
    init(from scoreboardCard: ScoreboardCard ) {
        self.scoreboardCard = scoreboardCard
    }
    
    var homeLogoImageUrl: URL? {
        guard let logoUrl = scoreboardCard.teams?.home?.logoUrl else {
            return nil
        }
        return URL(string: logoUrl)
    }
    
    var awayLogoImageUrl: URL? {
        guard let logoUrl = scoreboardCard.teams?.away?.logoUrl else {
            return nil
        }
        return URL(string: logoUrl)
    }
    
    var homeTeamName: String {
        return scoreboardCard.teams?.home?.name ?? "Home"
    }
    
    var awayTeamName: String {
        return scoreboardCard.teams?.away?.name ?? "Away"
    }
    
    var homeTeamScore: String {
        let score = scoreboardCard.game?.story?.pages?.last?.homeScore ?? 0
        return "\(score)"
    }
    
    var awayTeamScore: String {
        let score = scoreboardCard.game?.story?.pages?.last?.awayScore ?? 0
        return "\(score)"
    }
    
    var location: String {
        return "\(scoreboardCard.fixture?.venue?.name ?? "") \(scoreboardCard.fixture?.venue?.city ?? "")"
    }
}
