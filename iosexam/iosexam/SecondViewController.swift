//
//  SecondViewController.swift
//  iosexam
//
//  Created by Tahim Kader on 5/25/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SecondViewController: UITableViewController {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var IsbeastArr = [IsBeast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()

    }
    
    override func viewWillAppear(_ _animated: Bool) {
        super.viewWillAppear(_animated)
        fetchAllItems()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IsbeastArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            cell.textLabel?.text = IsbeastArr[indexPath.row].text
            var formatter = DateFormatter()
            formatter.dateStyle = .full
            //formatter.dateFormat = "dd-MM-yyyy"
            let setdate = formatter.string(from: IsbeastArr[indexPath.row].setdate! as Date)
            cell.detailTextLabel?.text = setdate
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = IsbeastArr[indexPath.row]
        managedObjectContext.delete(item)
        do {
            try managedObjectContext.save()
        }
        catch {
            print("\(error)")
        }
        IsbeastArr.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "IsBeast")
        do {
            let result = try managedObjectContext.fetch(request)
            IsbeastArr = result as! [IsBeast]
            tableView.reloadData()
        }
        catch {
            print("\(error)")
        }
    }
    
}
