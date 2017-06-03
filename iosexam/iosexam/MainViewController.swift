//
//  ViewController.swift
//  iosexam
//
//  Created by Tahim Kader on 5/25/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit
import CoreData


class MainViewController: UITableViewController, BeastDelegate, IsBeastDelegate {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var beastArr = [Beast]()
    var IsbeastArr = [IsBeast]()

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
        return beastArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        

        cell.beastlabel.text = beastArr[indexPath.row].text
        cell.buttonlabel.tag = indexPath.row
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "additem", sender: indexPath)
        
    }
    
    @IBAction func addbutton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "additem", sender: sender)
    }
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Beast")
        do {
            let result = try managedObjectContext.fetch(request)
            beastArr = result as! [Beast]
            tableView.reloadData()
        }
        catch {
            print("\(error)")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is UIBarButtonItem {
            let navigation = segue.destination as! UINavigationController
            let controller = navigation.topViewController as! AddBeastViewController
            controller.delegate = self
        }
        else if sender is NSIndexPath {
            let navigation = segue.destination as! UINavigationController
            let controller = navigation.topViewController as! AddBeastViewController
            controller.delegate = self
            let ip = sender as! NSIndexPath
            let item = beastArr[ip.row]
            controller.item = item.text!
            controller.ip = ip
        }
    }
    func cancelbuttonpressed(by controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    func savebuttonpressed(by controller: UIViewController, text: String, path: NSIndexPath?) {
        if let p = path {
            let item = beastArr[p.row]
            item.text = text
        }
        else {
            let item = NSEntityDescription.insertNewObject(forEntityName: "Beast", into: managedObjectContext) as! Beast
            item.text = text
            beastArr.append(item)
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = beastArr[indexPath.row]
        managedObjectContext.delete(item)
        do {
            try managedObjectContext.save()
        }
        catch {
            print("\(error)")
        }
        beastArr.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    func beastbuttonpressed(by controller: UITableViewCell, path: Int) {
        let item = NSEntityDescription.insertNewObject(forEntityName: "IsBeast", into: managedObjectContext) as! IsBeast
        let box = beastArr[path]
        item.text = beastArr[path].text
        let newdate = Date()
        item.setdate = newdate as! NSDate
        IsbeastArr.append(item)
        managedObjectContext.delete(box)
        do {
            try managedObjectContext.save()
        }
        catch {
            print("\(error)")
        }
        beastArr.remove(at: path)
        tableView.reloadData()
    }

    

}

