//
//  MainTabBarViewController.swift
//  BabyTracker
//
//  Created by Leon Soh on 7/12/21.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    /**
      Start of the initial coordinator
     */
    let home = HomeCoordinator(navigationController: UINavigationController())
    let settings = SettingsCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()

        home.start()
        settings.start()
        
        viewControllers = [home.navigationController, settings.navigationController]
    }
}
