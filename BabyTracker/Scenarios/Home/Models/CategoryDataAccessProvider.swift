//
//  CategoryDataAccessProvider.swift
//  BabyTracker
//
//  Created by Leon Soh on 13/12/21.
//

import Foundation
import CoreData
import RxSwift
import UIKit

final class CategoryDataAccessProvider {
    
    var categories: [NSManagedObject?] = []
    var managedObjectContext: NSManagedObjectContext!
    
    init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
       
        managedObjectContext = appDelegate.persistentContainer.viewContext
    }
    
    
    // MARK: - Core Data
    
    func save(title: String) {
       
        
        let entity = NSEntityDescription.entity(forEntityName: "Group", in: managedObjectContext)!
        let category = NSManagedObject(entity: entity, insertInto: managedObjectContext)
        category.setValue(title, forKey: "title")
        
        do {
            try managedObjectContext.save()
            categories.append(category)
        } catch let error as NSError {
            print("Could not save. \(error)")
        }
    }
    
}
