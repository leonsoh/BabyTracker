//
//  SettingsCoordinator.swift
//  BabyTracker
//
//  Created by Leon Soh on 7/12/21.
//

import Foundation
import UIKit

final class SettingsCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator
    
    func start() {
        let viewController = SettingsViewController.instantiate()
        setupUI(viewController: viewController)
        
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func setupUI(viewController: UIViewController) {
        viewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
    }
    
}
