//
//  GamePageViewController.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 15/03/2024.
//

import UIKit

class GamePageViewController: UIPageViewController {
    var scoreboardCard: ScoreboardCard!
    
    var detailsViewController: GameDetailsViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        detailsViewController = storyboard!.instantiateViewController(identifier: "GameDetailsViewController") as? GameDetailsViewController
        detailsViewController.viewModel = ScoreboardPagedDetailsViewModel(from: scoreboardCard)
        
        setViewControllers([detailsViewController], direction: .forward, animated: true)
    }
}

extension GamePageViewController : UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else {
            return
        }
        for previousVC in previousViewControllers {
            if let previousVideoContentVC = previousVC as? GameVideoContentViewController {
                previousVideoContentVC.playerView.stop()
            }
        }
        
        if let currentVideoVC = self.viewControllers?.first as? GameVideoContentViewController {
            currentVideoVC.playerView.play()
        }
    }

}

extension GamePageViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? GameVideoContentViewController,
              let currentViewIndex = scoreboardCard.game?.story?.pages?.firstIndex(where: { $0 == viewController.page }) else {
            return nil
        }
        
        if currentViewIndex == 0 {
            return detailsViewController
        } else {
            let newGameViewViewController = storyboard!.instantiateViewController(
                withIdentifier: "GameVideoContentViewController"
            ) as! GameVideoContentViewController
            newGameViewViewController.page = scoreboardCard.game?.story?.pages?[currentViewIndex - 1]
            
            return newGameViewViewController
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentViewIndex = scoreboardCard.game?.story?.pages?.firstIndex(where: {
            $0 == (viewController as? GameVideoContentViewController)?.page
        }) ?? -1
        
        guard currentViewIndex + 1 < scoreboardCard.game?.story?.pages?.count ?? 0 else {
            return nil
        }
        
        let newGameViewViewController = storyboard!.instantiateViewController(
            withIdentifier: "GameVideoContentViewController"
        ) as! GameVideoContentViewController
        newGameViewViewController.page = scoreboardCard.game?.story?.pages?[currentViewIndex + 1]

        return newGameViewViewController
    }
}
