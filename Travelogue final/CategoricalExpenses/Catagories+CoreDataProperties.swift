//
//  Catagories+CoreDataProperties.swift
//  CategoricalExpenses
//
//  Created by Thomas Bruntti on 12/9/20.
//  Copyright © 2020 Thomas Brunetti. All rights reserved.
//
//

import Foundation
import CoreData


extension Catagories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Catagories> {
        return NSFetchRequest<Catagories>(entityName: "Catagories")
    }

    @NSManaged public var title: String?
    @NSManaged public var rawExpenses: NSOrderedSet?

}

// MARK: Generated accessors for rawExpenses
extension Catagories {

    @objc(insertObject:inRawExpensesAtIndex:)
    @NSManaged public func insertIntoRawExpenses(_ value: Expense, at idx: Int)

    @objc(removeObjectFromRawExpensesAtIndex:)
    @NSManaged public func removeFromRawExpenses(at idx: Int)

    @objc(insertRawExpenses:atIndexes:)
    @NSManaged public func insertIntoRawExpenses(_ values: [Expense], at indexes: NSIndexSet)

    @objc(removeRawExpensesAtIndexes:)
    @NSManaged public func removeFromRawExpenses(at indexes: NSIndexSet)

    @objc(replaceObjectInRawExpensesAtIndex:withObject:)
    @NSManaged public func replaceRawExpenses(at idx: Int, with value: Expense)

    @objc(replaceRawExpensesAtIndexes:withRawExpenses:)
    @NSManaged public func replaceRawExpenses(at indexes: NSIndexSet, with values: [Expense])

    @objc(addRawExpensesObject:)
    @NSManaged public func addToRawExpenses(_ value: Expense)

    @objc(removeRawExpensesObject:)
    @NSManaged public func removeFromRawExpenses(_ value: Expense)

    @objc(addRawExpenses:)
    @NSManaged public func addToRawExpenses(_ values: NSOrderedSet)

    @objc(removeRawExpenses:)
    @NSManaged public func removeFromRawExpenses(_ values: NSOrderedSet)

}
