//
//  HomeViewController.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 14/03/2024.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel = ScoreBoardViewModel()
    
    private var scoreboards: [ScoreboardCard] {
        return viewModel.scoreboardCards
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    private func updateUI() {
        tableView.reloadData()
    }
}

extension HomeViewController : UITableViewDelegate {
    
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scoreboards.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCardTableViewCell", for: indexPath) as! ScoreCardTableViewCell
        
        cell.scoreCard = scoreboards[indexPath.row]
        
        return cell
    }
}

