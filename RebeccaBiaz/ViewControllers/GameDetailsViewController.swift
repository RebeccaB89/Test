//
//  GameDetailsViewController.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 17/03/2024.
//

import UIKit


class GameDetailsViewController: UIViewController {

    var viewModel: ScoreboardPagedDetailsViewModel!

    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var awayImageView: UIImageView!
    
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var homeScoreTabel: UILabel!
    
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeImageView.load(url: viewModel.homeLogoImageUrl)
        awayImageView.load(url: viewModel.awayLogoImageUrl)
        
        homeTeamNameLabel.text = viewModel.homeTeamName
        awayTeamNameLabel.text = viewModel.awayTeamName
        
        homeScoreTabel.text = viewModel.homeTeamScore
        awayScoreLabel.text = viewModel.awayTeamScore
        
        locationLabel.text = viewModel.location
    }
    
    @IBAction func didTaponCloseButton(_ sender: Any) {
        parent?.dismiss(animated: true)
    }
}
