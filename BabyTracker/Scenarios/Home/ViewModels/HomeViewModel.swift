//
//  HomeViewModel.swift
//  BabyTracker
//
//  Created by Leon Soh on 7/12/21.
//

import Foundation
import RxSwift
import RxCocoa
import CoreData
import RxDataSources

typealias SectionOfCategory = SectionModel<TableViewSection, TableViewItem>

enum TableViewSection {
    case main
}

enum TableViewItem {
    case category(item: Category)
}

struct HomeViewModel {
    
    // MARK: - Properties
    var items = PublishSubject<[Category]>()
   
    var categories = [
        Category(imageName: "fork.knife.circle", duration: "3 hours ago", note: "Feeding", frequency: "0 times"),
        Category(imageName: "face.smiling", duration: "59 mins ago", note: "Diaper changing", frequency: "0 times"),
        Category(imageName: "bed.double.circle", duration: "11 mins ago", note: "Sleeping", frequency: "0 times"),
    ]
    
    // MARK: - Functions
    
    func fetchItems() {
        items.onNext(categories)
        items.onCompleted()
    }
    
    func fetchCoreData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let foodFetchRequest: NSFetchRequest<Food> = Food.fetchRequest()
        let diaperFetchRequest: NSFetchRequest<Diaper> = Diaper.fetchRequest()
        let sleepFetchRequest: NSFetchRequest<Sleep> = Sleep.fetchRequest()
        

        appDelegate.persistentContainer.viewContext.perform {
            do {
                // Execute Fetch Request
                let foodResult = try foodFetchRequest.execute()
                let diaperResult = try diaperFetchRequest.execute()
                let sleepResult = try sleepFetchRequest.execute()
                
                print("Food item count:\(foodResult.count)")
                print("Diaper item count:\(diaperResult.count)")
                print("Sleep item count:\(sleepResult.count)")
            } catch {
                print("Unable to Execute Fetch Request, \(error)")
            }
        }
        
    }

}
