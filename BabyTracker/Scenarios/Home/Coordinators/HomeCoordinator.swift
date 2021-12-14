//
//  HomeCoordinator.swift
//  BabyTracker
//
//  Created by Leon Soh on 7/12/21.
//

import UIKit

final class HomeCoordinator : Coordinator {
    
    // MARK: - Properties
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator
    func start() {
        let viewController = HomeViewController.instantiate()
        viewController.delegate = self
        setupUI(viewController: viewController)
        
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func setupUI(viewController: UIViewController) {
        viewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
    }
    
    private func displayAddItemView(item: Category) {
        print("//Display AddItemViewController//")
    }
}


// MARK: - Delegates
extension HomeCoordinator: HomeViewControllerDelegate {
    
    func displaySelectedItem(item: Category) {
        displayAddItemView(item: item)
    }
    
}

