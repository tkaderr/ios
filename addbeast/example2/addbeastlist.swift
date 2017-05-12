//
//  ViewController.swift
//  example2
//
//  Created by Tahim Kader on 5/11/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    var tasks = [String]()
    
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        if let taskfield = taskTextField.text {
            tasks.insert(taskfield, at: tasks.count)
            tableView.reloadData()
            taskTextField.text = ""
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    // how should I create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        // set text label to the model that is corresponding to the row in array
        cell.textLabel?.text = tasks[indexPath.row]
        // return cell so that Table View knows what to render in each row
        return cell
    }
}

