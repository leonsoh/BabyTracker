//
//  SettingsViewController.swift
//  BabyTracker
//
//  Created by Leon Soh on 7/12/21.
//

import UIKit
import SnapKit

final class SettingsViewController: UIViewController, Storyboarded {
    
    // MARK: - Outlets
    lazy var label = UILabel()
    

    // MARK: - Properties
    
    var viewModel: SettingsViewModel!
    weak var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(label)
        label.text = "Settings"
        label.snp.makeConstraints { make in
            make.center.equalTo(self.view)
        }
    }
    



}
