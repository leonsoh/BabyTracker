//
//  Coordinator.swift
//  BabyTracker
//
//  Created by Leon Soh on 7/12/21.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
}
