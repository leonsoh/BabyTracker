//
//  DetailsListViewController.swift
//  BabyTracker
//
//  Created by Leon Soh on 22/12/21.
//

import UIKit
import RxCocoa
import RxSwift
import CoreData

class DetailsListViewController: UIViewController, Storyboarded {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var disposeBag = DisposeBag()
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupBinding()
    }
    
    
    private func setupData() {
        tableView.register(cellType: DetailsListTableViewCell.self)
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    
    // TODO: - Refactor
    func setupBinding() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        if category?.imageName == "fork.knife.circle" {
            let data = CoreDataObservable(fetchRequest: Food.fetchRequest(), context: context)
            
            data.bind(
                to: tableView.rx.items(
                    cellIdentifier: DetailsListTableViewCell.reuseIdentifier,
                    cellType: DetailsListTableViewCell.self)
            ) { index, model, cell in
                cell.foodModel = model
            }
        } else if category?.imageName == "face.smiling" {
            let data = CoreDataObservable(fetchRequest: Diaper.fetchRequest(), context: context)
            
            data.bind(
                to: tableView.rx.items(
                    cellIdentifier: DetailsListTableViewCell.reuseIdentifier,
                    cellType: DetailsListTableViewCell.self)
            ) { index, model, cell in
                cell.diaperModel = model
            }
        } else {
            let data = CoreDataObservable(fetchRequest: Sleep.fetchRequest(), context: context)
            
            data.bind(
                to: tableView.rx.items(
                    cellIdentifier: DetailsListTableViewCell.reuseIdentifier,
                    cellType: DetailsListTableViewCell.self)
            ) { index, model, cell in
                cell.sleepModel = model
            }
        }
        
    }
    
}


// MARK: - UITableViewDelegate
extension DetailsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete Item") {
            (action, sourceView, completionHandler) in
            
            completionHandler(true)
        }
        
        let swipeActionsConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        swipeActionsConfiguration.performsFirstActionWithFullSwipe = false
        
        return swipeActionsConfiguration
    }
}

