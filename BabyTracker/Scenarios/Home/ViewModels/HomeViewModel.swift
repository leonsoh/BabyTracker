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

struct HomeViewModel {
    
    // MARK: - Properties
    var items = PublishSubject<[Category]>()
    private var disposeBag = DisposeBag()
    
    // MARK: - Functions
    
    func fetchItems() {
        let categories = [
            Category(imageName: "face.smiling", duration: "59 mins ago", note: "formula 90ml", frequency: "5 times"),
            Category(imageName: "bed.double.circle", duration: "59 mins ago", note: "formula 90ml", frequency: "5 times"),
            Category(imageName: "person.circle", duration: "59 mins ago", note: "formula 90ml", frequency: "5 times"),
            Category(imageName: "theatermasks.circle", duration: "59 mins ago", note: "formula 90ml", frequency: "5 times"),
            Category(imageName: "fork.knife.circle", duration: "59 mins ago", note: "formula 90ml", frequency: "5 times")
        ]

        items.onNext(categories)
        items.onCompleted()
        items.disposed(by: disposeBag)
    }
        
}
