//
//  AddItemViewController.swift
//  BabyTracker
//
//  Created by Leon Soh on 14/12/21.
//

import UIKit
import RxSwift
import CoreData

final class AddItemViewController: UIViewController, Storyboarded {
    
    // MARK: - Outlets
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    var category: Category?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButtonDidTapped(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        var entity = NSEntityDescription.entity(forEntityName: "", in: context)
        
        
        if category?.imageName == "fork.knife.circle" {
            entity = NSEntityDescription.entity(forEntityName: "Food", in: context)
            
            let newItem = NSManagedObject(entity: entity!, insertInto: context)
            newItem.setValue(timeTextField.text, forKey: "duration")
            newItem.setValue(amountTextField.text, forKey: "note")
            
        } else if category?.imageName == "face.smiling" {
            entity = NSEntityDescription.entity(forEntityName: "Diaper", in: context)
            
            let newItem = NSManagedObject(entity: entity!, insertInto: context)
            newItem.setValue(timeTextField.text, forKey: "duration")
            newItem.setValue(amountTextField.text, forKey: "frequency")
            
        } else {
            entity = NSEntityDescription.entity(forEntityName: "Sleep", in: context)
            
            let newItem = NSManagedObject(entity: entity!, insertInto: context)
            newItem.setValue(timeTextField.text, forKey: "duration")
            newItem.setValue(amountTextField.text, forKey: "frequency")
        }
        
        
        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print("Error saving!")
        }
        
    }
    
    
}
