//
//  NewCategoryViewController.swift
//  ExpensesCoreData
//
//  Created by Thomas Bruntti on 12/9/20.
//  Copyright © 2020 Thomas Brunetti. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func saveCategory(_ sender: Any) {
        let category = Catagories(title: titleTextField.text ?? "")
        
        do{
            try category?.managedObjectContext?.save()
            self.navigationController?.popViewController(animated: true)
        }catch{
            print("Could not store category")
        }
    }
}

extension NewCategoryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
