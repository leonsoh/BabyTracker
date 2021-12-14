//
//  ViewController.swift
//  BabyTracker
//
//  Created by Leon Soh on 7/12/21.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class HomeViewController: UIViewController, Storyboarded {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
   
    // MARK: - Properties
    weak var coordinator: AppCoordinator?
    private var disposeBag = DisposeBag()
    private let viewModel = HomeViewModel()
    weak var delegate: HomeViewControllerDelegate?
    
    private lazy var dataSource = RxTableViewSectionedReloadDataSource<SectionOfCategory>(configureCell: configureCell)
    private lazy var configureCell: RxTableViewSectionedReloadDataSource<SectionOfCategory>.ConfigureCell = {
        [unowned self] (dataSource, tableView, indexPath, item) in
        
        switch item {
        case.category(let category):
            return self.configureHomeCell(category: category, atIndex: indexPath)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupBinding()
        
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
        
        // didSelectRowAtIndex for tableView
        tableView.rx.modelSelected(Category.self).withUnretained(self).bind { owner, item in
            owner.delegate?.displaySelectedItem(item: item)
        }.disposed(by: self.disposeBag)

        tableView.rx.itemSelected.withUnretained(self).bind { owner, indexPath in owner.tableView.deselectRow(at: indexPath, animated: true) }.disposed(by: disposeBag)
        
        // fetch items
        viewModel.fetchItems()
        
    }
    
    private func setupData() {
        tableView.register(cellType: HomeCell.self)
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
    }
    
    private func setupUI() {
        
    }
    
}


// MARK: - Protocols
protocol HomeViewControllerDelegate: AnyObject {
    func displaySelectedItem(item: Category)
}


// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addAction = UIContextualAction(style: .normal, title: "Add Item") {
            (action, sourceView, completionHandler) in
            
//            self.delegate?.displaySelectedItem(item: category)
             
            
            completionHandler(true)
            
        }
        
        let swipeActionsConfiguration = UISwipeActionsConfiguration(actions: [addAction])
        swipeActionsConfiguration.performsFirstActionWithFullSwipe = false
        
        return swipeActionsConfiguration
    }
}


extension HomeViewController {
    func configureHomeCell(category: Category, atIndex: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: HomeCell.reuseIdentifier, for: atIndex) as? HomeCell else {
            return UITableViewCell()
        }
        cell.model = category
        
        return cell
    }
}
