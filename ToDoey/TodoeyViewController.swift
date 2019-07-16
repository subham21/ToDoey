//
//  ViewController.swift
//  ToDoey
//
//  Created by Sanjay on 15/07/19.
//  Copyright © 2019 Subham Sah. All rights reserved.
//

import UIKit

class TodoeyViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
         this method didn't work :-
        if let items = UserDefaults.standard.array(forKey: "itemArray") as? [String] {
            itemArray = items
        }
        */
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
        
    }
    
    var itemArray = ["Item one", "Samsung M40", "RedMi note 7S"]
    
    let defaults = UserDefaults.standard
    
    
    //MARK - Table View Data Source Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "TodoItemCell")
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK - Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    //MARK - Add New Items
    
    @IBAction func UIBarButton(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add todo items", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) {
            (action) in
            print(textField.text!)
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK -
    
    //MARK -
    
    //MARK -
    
}

