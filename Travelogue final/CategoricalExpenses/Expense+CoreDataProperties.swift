//
//  Expense+CoreDataProperties.swift
//  CategoricalExpenses
//
//  Created by Thomas Bruntti on 12/9/20.
//  Copyright © 2020 Thomas Brunetti. All rights reserved.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var name: String?
    @NSManaged public var amount: String?
    @NSManaged public var desc: String?
    @NSManaged public var rawDate: NSDate?
    @NSManaged public var rawPhoto: NSObject?
    @NSManaged public var catagory: Catagories?

}
