//
//  ViewController.swift
//  bucketlist6
//
//  Created by Tahim Kader on 5/23/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit
import CoreData

class BucketListViewController: UITableViewController, AddItemDelegate {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
 
    var arr = [BucketListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row].text!
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        // The code will execute and perform a segue on the specified identifier and run the "prepare for segue" function (below)
        performSegue(withIdentifier: "addsegue", sender: indexPath)
    }
    
    
    
    
    @IBAction func addbutton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addsegue", sender: sender)
    }
    
    // Code that will execute when the add button is pressed
 
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is UIBarButtonItem {
            let navigation = segue.destination as! UINavigationController
            let controller = navigation.topViewController as! AddItemViewController
            controller.delegate = self
        }
        else if sender is NSIndexPath {
            let navigation = segue.destination as! UINavigationController
            let controller = navigation.topViewController as! AddItemViewController
            controller.delegate = self
            let ip = sender as! NSIndexPath
            let item = arr[ip.row]
            controller.item = item.text!
            controller.ip = ip
            
        }
        
    }
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BucketListItem")
        do {
            let result = try managedObjectContext.fetch(request)
            arr = result as! [BucketListItem]
            tableView.reloadData()
            
        }
        catch {
            print("\(error)")
        }
    }

    func cancelbuttonpressed(by controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = arr[indexPath.row]
        managedObjectContext.delete(item)
        do {
            try managedObjectContext.save()
        }
        catch {
            print("\(error)")
        }
        arr.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    func savebuttonpressed(by controller: UIViewController, text: String, path: NSIndexPath?) {
        if let p = path {
            let item = arr[p.row]
            item.text = text
        }
        else {
            let item = NSEntityDescription.insertNewObject(forEntityName: "BucketListItem", into: managedObjectContext) as! BucketListItem
            item.text = text
            arr.append(item)
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

