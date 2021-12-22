//
//  CoreDataObservable.swift
//  BabyTracker
//
//  Created by Leon Soh on 21/12/21.
//

import Foundation
import CoreData
import RxCocoa
import RxSwift

class CoreDataObservable<T>: NSObject, ObservableType, NSFetchedResultsControllerDelegate where T: NSManagedObject {
   
    // MARK: - Properties
    private var fetchedResultsController: NSFetchedResultsController<NSManagedObject>?
    private let context: NSManagedObjectContext
    private let fetchRequest: NSFetchRequest<T>
    private let results = BehaviorSubject<[T]>(value: [])
    private var subscriptions = 0
    
    typealias Element = [T]
    
    init(fetchRequest: NSFetchRequest<T>, context: NSManagedObjectContext) {
        if fetchRequest.sortDescriptors == nil {
            fetchRequest.sortDescriptors = []
        }
        
        self.fetchRequest = fetchRequest
        self.context = context
        super.init()
    }
    
    // MARK: - ObservableType implementation
    func subscribe<Observer>(_ observer: Observer) -> Disposable where Observer: ObserverType, CoreDataObservable.Element == Observer.Element {
        var start = false
        
        objc_sync_enter(self)
        subscriptions += 1
        start = subscriptions == 1
        objc_sync_exit(self)
        
        if start {
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            
            controller.delegate = self
            context.perform {
                do {
                    try controller.performFetch()
                    let result = controller.fetchedObjects ?? []
                    self.results.onNext(result)
                } catch {
                    print("Error in fetching objects")
                }
            }
            fetchedResultsController = controller as? NSFetchedResultsController<NSManagedObject>
        }
        
        return FetcherDisposable(fetcher: self, observer: observer)
    }
    
    // MARK: - NSFetchedResultControllerDelegate implementation
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        let result = controller.fetchedObjects as? [T] ?? []
        results.onNext(result)
    }
    
    private func dropSubscription() {
        var stop = false
        objc_sync_enter(self)
        subscriptions -= 1
        stop = subscriptions == 0
        objc_sync_exit(self)
        
        if stop {
            fetchedResultsController?.delegate = nil
            fetchedResultsController = nil
        }
    }
    
    // MARK: - Disposable
    private class FetcherDisposable: Disposable {
        var fetcher: CoreDataObservable?
        var disposable: Disposable?
        
        init<Observer>(fetcher: CoreDataObservable, observer: Observer) where Observer: ObserverType, CoreDataObservable.Element == Observer.Element {
            self.fetcher = fetcher
            self.disposable = fetcher.results.subscribe(onNext: {
                observer.onNext($0)
            }, onError: {
                observer.onError($0)
            }, onCompleted: {
                observer.onCompleted()
            }, onDisposed: {})
            
           
        }
        
        func dispose() {
            disposable?.dispose()
            disposable = nil
            
            fetcher?.dropSubscription()
            fetcher = nil
        }
    }
    
}
