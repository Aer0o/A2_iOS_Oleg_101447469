//
//  StoreProduct+CoreDataProperties.swift
//  A2_iOS_Oleg_101447469
//
//  Created by Nadia Rukhlia on 2025-03-28.
//
//

import Foundation
import CoreData


extension StoreProduct {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoreProduct> {
        return NSFetchRequest<StoreProduct>(entityName: "Product")
    }

    @NSManaged public var desc: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var provider: String?

}

extension StoreProduct : Identifiable {

}
