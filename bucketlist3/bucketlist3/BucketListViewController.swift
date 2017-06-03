//
//  ViewController.swift
//  bucketlist3
//
//  Created by Tahim Kader on 5/17/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit
import Foundation

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {
    
    
    //Create initial list
    var items = ["Go Home", "Sleep for a longtime", "Eat food"]

    
    //Code that will load immediately after view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        
        
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "edititemsegue", sender: indexPath)
    }
    
    @IBAction func addbutton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "edititemsegue", sender: sender)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender is UIBarButtonItem{
            let navigationController = segue.destination as! UINavigationController
            let additemtableviewcontroller = navigationController.topViewController as! AddItemTableViewController
            additemtableviewcontroller.delegate = self
            
        }
        else if sender is NSIndexPath{
            let navigationController = segue.destination as! UINavigationController
            let additemtableviewcontroller = navigationController.topViewController as! AddItemTableViewController
            additemtableviewcontroller.delegate = self
            let ip = sender as! NSIndexPath
            let item = items[ip.row]
            additemtableviewcontroller.item = item
            additemtableviewcontroller .indexPath = ip
        }
        
        
        print(sender)
    }
    
    func cancelbuttonpressed(by controller: AddItemTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func savebuttonpressed(by controller: AddItemTableViewController, text: String, path: NSIndexPath?) {
        
        if let ipp = path {
            items[ipp.row] = text
        }
        else {
            items.append(text)
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
}

