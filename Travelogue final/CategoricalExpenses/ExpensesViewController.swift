//
//  ExpensesViewController.swift
//  Expenses
//
//  Created by Thomas Bruntti on 12/9/20.
//  Copyright © 2020 Thomas Brunetti. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController {

    @IBOutlet weak var expensesTableView: UITableView!
    
    let dateFormatter = DateFormatter()
    
    var category: Catagories?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .long

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.expensesTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewExpense(_ sender: Any) {
        performSegue(withIdentifier: "showExpense", sender: self)
    }
}

extension ExpensesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.expenses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expensesTableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
        if let expense = category?.expenses?[indexPath.row]{
            cell.textLabel?.text = expense.name
            if let date = expense.date{
                cell.detailTextLabel?.text = dateFormatter.string(from: date)
            }
        }
        
        return cell
    }
    func deleteExpense(at indexPath: IndexPath){
        guard let expense = category?.expenses?[indexPath.row],
            let managedContext = expense.managedObjectContext else{
                return
        }
        managedContext.delete(expense)
        do{
            try managedContext.save()
            expensesTableView.deleteRows(at: [indexPath], with: .automatic)
        }catch{
            print("could not delete")
            expensesTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteExpense(at: indexPath)
        }
    }

}

extension ExpensesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showExpense", sender: self)
    }
    

}


