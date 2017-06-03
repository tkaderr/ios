//
//  ViewController.swift
//  binary
//
//  Created by Tahim Kader on 5/21/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arr = [1, 10, 100, 1000, 10000, 100000, 1000000]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ten
        cell.textlabel.text = String(arr[indexPath.row])
        return cell
    }
}

