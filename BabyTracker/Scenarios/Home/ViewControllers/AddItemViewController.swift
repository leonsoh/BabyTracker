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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
