//
//  Expense+CoreDataClass.swift
//  CategoricalExpenses
//
//  Created by Thomas Bruntti on 12/9/20.
//  Copyright © 2020 Thomas Brunetti. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {
    var date: Date?{
        get{
            return rawDate as Date?
        }
        set{
            rawDate = newValue as NSDate?
        }
    }
    convenience init?(name: String, amount: String, date: Date?, desc: String?) {
        let appDeligate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDeligate?.persistentContainer.viewContext
            else{
                return nil
        }
        self.init(entity: Expense.entity(), insertInto: context)
        self.name = name
        self.date = date
        self.amount = amount
        self.desc = desc
        
    }
}
