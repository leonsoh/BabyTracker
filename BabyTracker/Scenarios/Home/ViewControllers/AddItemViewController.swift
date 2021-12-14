//
//  AddItemViewController.swift
//  BabyTracker
//
//  Created by Leon Soh on 14/12/21.
//

import UIKit
import RxSwift

final class AddItemViewController: UIViewController, Storyboarded {
    
    // MARK: - Outlets
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    var category: Category?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        guard let category = category else {
            return
        }
        
        timeTextField.text = category.duration
        amountTextField.text = category.note
    }
  
}
