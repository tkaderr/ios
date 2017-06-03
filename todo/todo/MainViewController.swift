//
//  ViewController.swift
//  todo
//
//  Created by Tahim Kader on 5/21/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class MainViewController: UITableViewController, AddItemDelegate {
    
    var arr = [Todo]()
    
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
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomViewController
        cell.titlelabel?.text = arr[indexPath.row].title!
        cell.descriptionlabel?.text = arr[indexPath.row].descip!
        cell.datelabel?.text = String(describing: arr[indexPath.row].date!)
        let status = arr[indexPath.row].check
        print("status is \(status)")
        if arr[indexPath.row].check == false {
            cell.accessoryType = .none
        }
        else {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigation = segue.destination as! UINavigationController
        let controller = navigation.topViewController as! AddItemViewController
        controller.delegate = self
    }
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Todo")
        do {
            let result = try managedObjectContext.fetch(request)
            arr = result as! [Todo]
            tableView.reloadData()
        }
        catch {
            print("\(error)")
        }
    }
    
    func cancelbuttonpressed(by controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func savebuttonpressed(by controller: UIViewController, title: String, desc: String, date: Date) {
        let item = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: managedObjectContext) as! Todo
        item.title = title
        item.descip = desc
//        var formatter = DateFormatter()
//        formatter.dateFormat = "dd-MM-yyyy"
//        let setdate = formatter.string(from: date)
//        let newdate = formatter.dateFormat(
        item.date = date as NSDate
        item.check = false
        arr.append(item)
    
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
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        print("made it to the did select row")
//        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
//             print("made it to the did select row nested")
//            cell.accessoryType = .checkmark
//            let item = arr[indexPath.row]
//            item.check = true
//            do {
//                try managedObjectContext.save()
//            }
//            catch {
//                print("\(error)")
//            }
//            
//            tableView.reloadData()
//            
//        }
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("made it to the did select row")
        if let cell = tableView.cellForRow(at: indexPath) {
            
            if cell.accessoryType == .checkmark {
                //print("made it to the did select row nested")
                cell.accessoryType = .none
                let item = arr[indexPath.row]
                item.check = false
                do {
                    try managedObjectContext.save()
                }
                catch {
                    print("\(error)")
                }
                
                tableView.reloadData()
            }
            else {
                cell.accessoryType = .checkmark
                let item = arr[indexPath.row]
                item.check = true
                do {
                    try managedObjectContext.save()
                }
                catch {
                    print("\(error)")
                }
                
                tableView.reloadData()
            }
        }

    }
    
//    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        print("made it again")
//        
//        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
//            cell.accessoryType = .none
//            let item = arr[indexPath.row]
//            item.check = false
//            do {
//                try managedObjectContext.save()
//            }
//            catch {
//                print("\(error)")
//            }
//            
//            tableView.reloadData()
//        }
//    }
//    



}

