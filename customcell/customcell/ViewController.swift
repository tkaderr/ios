//
//  ViewController.swift
//  customcell
//
//  Created by Tahim Kader on 5/21/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class CustomCellViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var nums = [1, 90, 32, 23, 9, 12]
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        //cell.rightLabel.text = "\(nums[indexPath.row])"
        if nums[indexPath.row] > 24 {
            cell.leftlabel.backgroundColor = UIColor.green
        } else {
            cell.button.backgroundColor = UIColor.red
        }
        // return cell so that Table View knows what to draw in each row
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
    }
}




