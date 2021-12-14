//
//  CDCategory.swift
//  BabyTracker
//
//  Created by Leon Soh on 13/12/21.
//

import Foundation
import CoreData

final class CDCategory: NSManagedObject {
    @NSManaged public var imageName: String?
    @NSManaged public var duration: String?
    @NSManaged public var note: String?
    @NSManaged public var frequency: String?
    
}
