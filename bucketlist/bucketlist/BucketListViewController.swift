//
//  ViewController.swift
//  bucketlist
//
//  Created by Tahim Kader on 5/16/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, AdditemTableViewControllerDelegate {
    
    var items = ["Go to moon", "eat candy", "swim in amazone", "ride a bike"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemSegue"{
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AdditemTableViewController
            print(navigationController.childViewControllers[0])
            print(navigationController.childViewControllers)
            addItemTableViewController.delegate = self
        }
        else if segue.identifier == "EditItemSegue" {
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AdditemTableViewController
            addItemTableViewController.delegate = self
            
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTableViewController.item = item
            addItemTableViewController.indexPath = indexPath
        }
    }
    
    func cancelButtonPressed(by controller: AdditemTableViewController) {
        print("hello")
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AdditemTableViewController, with text: String, at indexPath: NSIndexPath?) {
        
        if let ip = indexPath {
            items[ip.row] = text
        }
        else {
            items.append(text)
        }
        print("hello")
        items.append(text)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }


}

