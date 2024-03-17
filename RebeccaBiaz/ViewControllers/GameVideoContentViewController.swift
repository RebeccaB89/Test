//
//  GameVideoContentViewController.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 17/03/2024.
//

import UIKit

class GameVideoContentViewController: UIViewController {

    var page: Page?
    
    @IBOutlet weak var playerView: PlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let videoUrl = page?.videoUrl {
            playerView.prepareVideo(videoUrl)
            playerView.play()
        }
    }
    
    @IBAction func didTaponCloseButton(_ sender: Any) {
        parent?.dismiss(animated: true)
    }

}
