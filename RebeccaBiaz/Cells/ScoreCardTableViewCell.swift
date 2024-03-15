//
//  ScoreCardTableViewCell.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 15/03/2024.
//

import UIKit

protocol ScoreCardTableViewCellDelegate: AnyObject {
    func openScoreboardDetails(from cell: ScoreCardTableViewCell, with scoreCard: ScoreboardCard?)
}


class ScoreCardTableViewCell: UITableViewCell {

    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var homeScoreLabel: UILabel!
    
    @IBOutlet weak var awayImageView: UIImageView!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    
    weak var delegate: ScoreCardTableViewCellDelegate?
    
    var scoreCard : ScoreboardCard? {
        didSet {
            homeTeamLabel.text = scoreCard?.teams?.home?.name ?? "Home Team"
            homeImageView.load(url: URL(string: scoreCard?.teams?.home?.logoUrl ?? ""))
            
            if let homeScore = scoreCard?.game?.pages?.last?.homeScore {
                homeScoreLabel.text = "\(homeScore)"
            }
            
                               
            awayTeamLabel.text = scoreCard?.teams?.away?.name ?? "Away Team"
            awayImageView.load(url: URL(string: scoreCard?.teams?.away?.logoUrl ?? ""))
            if let awayScore = scoreCard?.game?.pages?.last?.awayScore {
                awayScoreLabel.text = "\(awayScore)"
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        homeTeamLabel.text = nil
        awayTeamLabel.text = nil
        
        homeImageView.image = nil
        awayImageView.image = nil
        
        homeScoreLabel.text = nil
        awayScoreLabel.text = nil
    }
    
    
    @IBAction func didTapOpenDetails(_ sender: Any) {
        delegate?.openScoreboardDetails(from: self, with: scoreCard)
    }
}
