//
//  NewExpenseViewController.swift
//  Expenses
//
//  Created by Thomas Bruntti on 12/9/20.
//  Copyright © 2020 Thomas Brunetti. All rights reserved.
//

import UIKit

class NewExpenseViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    let imagePicker =  UIImagePickerController()
    
    var category: Catagories?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.delegate = self
        amountTextField.delegate = self
        
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
            
        }else{
            print("there is no camera")
            let alert = UIAlertController(title: "No camera found?", message: "Sorry action aborted", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        amountTextField.resignFirstResponder()
    }
    
    @IBAction func saveExpense(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let date = datePicker.date
        let amount = "1.0"
        let desc = amountTextField.text ?? ""
        
        if let expense = Expense(name: name, amount: amount, date: date, desc: desc){
            category?.addToRawExpenses(expense)
            do {
               try expense.managedObjectContext?.save()
                self.navigationController?.popViewController(animated: true)
            }catch{
                print("could not save")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? NewExpenseViewController else{
                return
        }
        destination.category = category
    }
}

extension NewExpenseViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
