//
//  CategoriesViewController.swift
//  ExpensesCoreData
//
//  Created by Thomas Bruntti on 12/9/20.
//  Copyright © 2020 Thomas Brunetti. All rights reserved.
//

import UIKit
import CoreData

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesTableView: UITableView!
    
    var catagories: [Catagories] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Catagories> = Catagories.fetchRequest()
        do{
           catagories = try managedContext.fetch(fetchRequest)
            categoriesTableView.reloadData()
        }catch{
            print("Could not load")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catagories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        let category = catagories[indexPath.row]
        
        cell.textLabel?.text = category.title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ExpensesViewController,
            let selectedRow = self.categoriesTableView.indexPathForSelectedRow?.row else{
                return
            }
            destination.category = catagories[selectedRow]
        }
    func deleteCatagory(at indexPath: IndexPath){
        let category = catagories[indexPath.row]
        guard let managedContext = category.managedObjectContext else {
            return
        }
        managedContext.delete(category)
        
        do{
            try managedContext.save()
            
            catagories.remove(at: indexPath.row)
            categoriesTableView.deleteRows(at: [indexPath], with: .automatic)
            
        }catch{
            print("Could not delete")
            categoriesTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteCatagory(at: indexPath)
        }
    }
}
