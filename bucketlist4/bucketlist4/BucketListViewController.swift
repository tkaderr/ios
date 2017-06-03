//
//  ViewController.swift
//  bucketlist4
//
//  Created by Tahim Kader on 5/17/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit
import CoreData

class BucketListViewController: UITableViewController, AddItemViewControllerDelegate {
    
    
    //Initialize the array of BucketListItem object
    var items = [BucketListItem]()
    
    //Create the moc -- get a copy of the datatable
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    //Code that will execute after view is initially loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This function will fetch and load the view with all data in data tables
        fetchAllItems()
        
    }

    
    //For table views- determine how many rows need to be generated
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    //For table views- determine what to populate each table view cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].text!
        return cell
    }
    
    //code that will execute when the accessory button in the cell is selected
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        // The code will execute and perform a segue on the specified identifier and run the "prepare for segue" function (below)
        performSegue(withIdentifier: "additemsegue", sender: indexPath)
    }
    
    
    // Code that will execute when the add button is pressed
    @IBAction func addbutton(_ sender: UIButton) {
        
        // The code will execute and perform a segue on the specified identifier and run the "prepare for segue" function (below)
        performSegue(withIdentifier: "additemsegue", sender: sender)
    }
    
    //Code that will execute when a performSegue is executed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        // Depending on which sender object is selected, the if/else code will execute
        if sender is UIBarButtonItem {
            
            //Code shows where the start point of the segue begins and ends
            let navigation = segue.destination as! UINavigationController
            let controller = navigation.topViewController as! AddItemViewController
            
            //establishes which viewcontroller is the delegate
            controller.delegate = self
        }
            
        //If a previous existing data row is selected, the text and the indexpath is passed to the AddItemView Controller
        else if sender is NSIndexPath{
            let navigation = segue.destination as! UINavigationController
            let controller = navigation.topViewController as! AddItemViewController
            controller.delegate = self
            let ip = sender as! NSIndexPath
            let item = items[ip.row]
            controller.texter = item.text!
            controller.indexpat = ip
        }
    }
    
    //Function to retrieve all data rows in the local db
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BucketListItem")
        do {
            let result = try managedObjectContext.fetch(request)
            items = result as! [BucketListItem]
            tableView.reloadData()
            
        }
        catch {
            print("\(error)")
        }
    }
    
    
    //Code to execute when the swipe delete function occurs on a selected cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        managedObjectContext.delete(item)
        do {
            try managedObjectContext.save()
        }
        catch {
            print("\(error)")
        }
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    //Code that will execute when the cancel button in the AddItemViewController is selected
    func cancelbuttonpressed(controller bycontroller: UIViewController) {
        
        //Close the modal
        dismiss(animated: true, completion: nil)
    }
    
    //Code that will execute when save buttoned in the AddItemViewController is selected
    func savebuttonpressed(controller: UIViewController, text: String, path: NSIndexPath?) {
        if let ipp = path {
            //items[ipp.row] = text
            let item = items[ipp.row]
            item.text = text
        }
        else if text.characters.count > 0{
            //items.append(text)
            let item = NSEntityDescription.insertNewObject(forEntityName: "BucketListItem", into: managedObjectContext) as! BucketListItem
            item.text = text
            items.append(item)
        }
        
        do {
            try managedObjectContext.save()
        }
        catch {
            print("\(error)")
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    
}

