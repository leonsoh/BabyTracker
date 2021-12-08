//
//  ViewController.swift
//  BabyTracker
//
//  Created by Leon Soh on 7/12/21.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, Storyboarded {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
   
    // MARK: - Properties
    weak var coordinator: AppCoordinator?
    private var disposeBag = DisposeBag()
    private let viewModel = HomeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        setupBinding()
        setupData()
    }
    
    // MARK: - Setups
    
    private func setupBinding() {
        
        // Bind items to tableView
        viewModel.items.bind(
            to: tableView.rx.items(
                cellIdentifier: HomeCell.reuseIdentifier,
                cellType: HomeCell.self)
        ) { row, model, cell in
            cell.model = model
        }.disposed(by: disposeBag)
        
        // Bind a model selected handler
        tableView.rx.modelSelected(Category.self).bind { category in
            print(category.title)
        }
        
        // fetch items
        viewModel.fetchItems()
    }
    
    private func setupData() {
        tableView.register(cellType: HomeCell.self)
    }
    
    

}

