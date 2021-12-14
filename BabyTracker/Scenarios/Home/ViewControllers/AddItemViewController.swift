//
//  AddItemViewController.swift
//  BabyTracker
//
//  Created by Leon Soh on 14/12/21.
//

import UIKit
import RxSwift

final class AddItemViewController: UIViewController {
    
    private let category: Category

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(item: Category) {
        self.category = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
