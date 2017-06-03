//
//  ViewController.swift
//  todo2
//
//  Created by Tahim Kader on 5/23/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UITableViewController, customcelldelegate {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    var arr = [Todo]()

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customcell
        cell.titlelabel.text = arr[indexPath.row].title
        var formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let setdate = formatter.string(from: arr[indexPath.row].setdate! as Date)
        cell.datelabel.text = setdate
        cell.descriptionlabel.text = arr[indexPath.row].descript
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
    
    func cancelbuttonpressed(by controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }

    func savebuttonpressed(by controller: UIViewController, title: String, descrip: String, date: Date) {
        let item = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: managedObjectContext) as! Todo
        
        item.title = title
        item.descript = descrip
        item.setdate = date as NSDate
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
}

