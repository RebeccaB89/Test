//
//  ScoreCardTableViewCell.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 15/03/2024.
//

import UIKit

class ScoreCardTableViewCell: UITableViewCell {

    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var awayImageView: UIImageView!
    @IBOutlet weak var awayTeamLabel: UILabel!
    
    var scoreCard : ScoreboardCard? {
        didSet {
            homeTeamLabel.text = scoreCard?.teams?.home?.name ?? "Home Team"
            homeImageView.load(url: URL(string: scoreCard?.teams?.home?.logoUrl ?? ""))
                               
            awayTeamLabel.text = scoreCard?.teams?.away?.name ?? "Away Team"
            awayImageView.load(url: URL(string: scoreCard?.teams?.away?.logoUrl ?? ""))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        homeTeamLabel.text = nil
        awayTeamLabel.text = nil
        homeImageView.image = nil
        awayImageView.image = nil
    }

}
