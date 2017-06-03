//
//  ViewController.swift
//  bucket5
//
//  Created by Tahim Kader on 5/20/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit
import CoreData

class BucketListViewController: UITableViewController, AddItemViewControllerDelegate {
    
    var items = [BucketListItem]()
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


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
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].text!
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "addsegue", sender: indexPath)
        
    }
    
    @IBAction func addbutton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addsegue", sender: sender)
    }
    
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
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BucketListItem")
        do {
            let result = try managedObjectContext.fetch(request)
            items = result as! [BucketListItem]
        }
        catch {
            print("\(error)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender is NSIndexPath {
            let navigation = segue.destination as! UINavigationController
            let controller = navigation.topViewController as! AddItemViewController
            controller.delegate = self
            let ip = sender as! NSIndexPath
            let item = items[ip.row]
            controller.texter = item.text!
            controller.pathway = ip
        }
        else if sender is UIBarButtonItem {
            let navigation = segue.destination as! UINavigationController
            let controller = navigation.topViewController as! AddItemViewController
            controller.delegate = self
            
        }
    }
    
    func cancebuttonpressed(by contoller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func savebuttonpressed(by controller: UIViewController, text: String, path: NSIndexPath?) {
        
        if let ipp = path {
            items[ipp.row].text = text
        }
        else {
            
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

