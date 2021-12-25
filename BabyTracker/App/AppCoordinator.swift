//
//  AppCoordinator.swift
//  BabyTracker
//
//  Created by Leon Soh on 7/12/21.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    private var window: UIWindow
    
    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        childCoordinators.append(homeCoordinator)
        
        window.rootViewController = MainTabBarViewController()
        window.makeKeyAndVisible()
    }

}
