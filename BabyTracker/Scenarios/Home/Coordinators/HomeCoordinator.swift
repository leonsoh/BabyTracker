//
//  HomeCoordinator.swift
//  BabyTracker
//
//  Created by Leon Soh on 7/12/21.
//

import UIKit
import Differentiator

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
        
        navigationController.pushViewController(viewController, animated: false)
    }

    private func displayAddItemView(item: Category) {
        let viewController = AddItemViewController.navigateToAddItemViewController()
        viewController.category = item
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func displayDetailsListViewController(item: Category) {
        let viewController = DetailsListViewController.navigateToDetailsListViewController()
        viewController.category = item
        
        navigationController.pushViewController(viewController, animated: true)
    }
}


// MARK: - Delegates
extension HomeCoordinator: HomeViewControllerDelegate {
    func addSelectedItem(item: Category) {
        displayAddItemView(item: item)
    }
    func displaySelectedItem(item: Category) {
        displayDetailsListViewController(item: item)
    }
    
}

