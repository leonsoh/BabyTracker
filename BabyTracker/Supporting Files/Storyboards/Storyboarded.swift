//
//  Storyboarded.swift
//  BabyTracker
//
//  Created by Leon Soh on 7/12/21.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
    static func navigateToAddItemViewController() -> Self
    static func navigateToDetailsListViewController() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
      
        let storyboardName = id.replacingOccurrences(of: "ViewController", with: "")
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
    
    static func navigateToAddItemViewController() -> Self {
        let id = "AddItemViewController"
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)

        return storyboard.instantiateViewController(withIdentifier: id) as! Self
        
    }
    
    static func navigateToDetailsListViewController() -> Self {
        let id = "DetailsListViewController"
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
    
}
