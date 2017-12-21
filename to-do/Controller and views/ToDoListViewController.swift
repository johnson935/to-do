//
//  ViewController.swift
//  to-do
//
//  Created by Johuson on 20/12/2017.
//
//change properties of the navigation bar by selecting the main navigation view controller and change the titles in each individual view controller no need to do it in the main navigation controller
// set singleton in a class using static let and the value of the singleton will stay the same across different objects and classes
import UIKit

class ToDoListViewController: UITableViewController {
// array of item objects
    var listArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Wake up"
        listArray.append(newItem)
        // Do any additional setup after loading the view, typically from a nib.
        //optional binding for saved defaults after adding item and saves the data even after the app terminates, we set item as string
       if let item = defaults.array(forKey: "toDoListArray") as? [Item] {
           listArray = item
        }
        
  //  }

    //Mark - Table view datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = listArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        print(indexPath.row)
    //indexpath is a 2 dimensional array so you have to specify its row property.
     // Ternary operator ==>
        //value = condition? valueiftrue : valueiffalse
        
        cell.accessoryType = item.done ? .checkmark : .none
        //The above code represents the code below
        //if item.done == true {
          //  cell.accessoryType = .checkmark
       // } else {
         //  cell.accessoryType = .none
        //}
       // return cell
    }
 
    //Mark - Tableview delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // when the cell is tapped the cell flashes grey instead of staying grey
        
        //chages the value of the booleen so the new done is not equal to the old one
        listArray[indexPath.row].done = !listArray[indexPath.row].done
        tableView.deselectRow(at: indexPath, animated: true)
  
        tableView.reloadData()
        print(indexPath)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new today item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) {
            (action) in
            
            if  textField.text != "" {
                let anotherItem = Item()
                anotherItem.title = textField.text!
                 self.listArray.append(anotherItem)
                self.defaults.set(self.listArray, forKey: "toDoListArray")
            }else {
                let alert2 = UIAlertController(title: "No item entered", message: "", preferredStyle: .alert)
                
                let action2 = UIAlertAction(title: "Ok", style: .default)
                alert2.addAction(action2)
                self.present(alert2, animated: true, completion: nil)
            }
           
            self.tableView.reloadData()
          
            }
        alert.addTextField{ (alertTextField) in
            alertTextField.placeholder = "Enter new item"
            textField = alertTextField
        
           
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

