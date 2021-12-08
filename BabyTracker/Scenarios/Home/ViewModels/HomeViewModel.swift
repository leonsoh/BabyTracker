//
//  HomeViewModel.swift
//  BabyTracker
//
//  Created by Leon Soh on 7/12/21.
//

import Foundation
import RxSwift
import RxCocoa

struct HomeViewModel {
    
    // MARK: - Properties
    var items = PublishSubject<[Category]>()
    
    // MARK: - Functions
    
    func fetchItems() {
        let categories = [
            Category(imageName: "face.smiling", title: "Baby"),
            Category(imageName: "bed.double.circle", title: "Sleep"),
            Category(imageName: "person.circle", title: "Profile"),
            Category(imageName: "theatermasks.circle", title: "Activity"),
            Category(imageName: "fork.knife.circle", title: "Feed")
        ]

        items.onNext(categories)
        items.onCompleted()
    }
        
}
