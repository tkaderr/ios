//
//  ViewController.swift
//  agingpeople
//
//  Created by Tahim Kader on 5/11/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    var names = ["Bob", "Bill", "John"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return names.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Person
        
    
    cell.namelabel.text = names[indexPath.row]
    cell.numberlabel.text = String(arc4random_uniform(96)+5)
    
    return cell
    }
    
}

class Person: UITableViewCell {
  
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var numberlabel: UILabel!
   
}
