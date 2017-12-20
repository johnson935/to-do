//
//  ViewController.swift
//  to-do
//
//  Created by Johuson on 20/12/2017.
//
//change properties of the navigation bar by selecting the main navigation view controller and change the titles in each individual view controller no need to do it in the main navigation controller
import UIKit

class ToDoListViewController: UITableViewController {

    let  listArray = ["Wake up","Brush teeth","Study"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Mark - Table view datasource methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    cell.textLabel?.text = listArray[indexPath.row]
        print(indexPath.row)
    //indexpath is a 2 dimensional array so you have to specify its row property.
        
        return cell
    }
 
    //Mark - Tableview delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // when the cell is tapped the cell flashes grey instead of staying grey
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        print(indexPath)
    }
    
}

