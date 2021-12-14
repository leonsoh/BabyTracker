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
    
    let categories = [
        Category(imageName: "face.smiling", duration: "59 mins ago", note: "formula 90ml", frequency: "5 times"),
        Category(imageName: "bed.double.circle", duration: "11 mins ago", note: "formula 120ml", frequency: "6 times"),
        Category(imageName: "person.circle", duration: "29 mins ago", note: "formula 30ml", frequency: "8 times"),
        Category(imageName: "theatermasks.circle", duration: "2 hours ago", note: "formula 90ml", frequency: "8 times"),
        Category(imageName: "fork.knife.circle", duration: "3 hours ago", note: "formula 60ml", frequency: "7 times")
    ]
    
    // MARK: - Functions
    
    func fetchItems() {
        items.onNext(categories)
        items.onCompleted()
    }
        
}
