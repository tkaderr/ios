//
//  ViewController.swift
//  binarycounter
//
//  Created by Tahim Kader on 5/22/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, CustomCellDelegate {
    
    @IBOutlet weak var sumlabel: UILabel!
    var sum = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        sumlabel.text = "Total: 0"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.valuelabel?.text = String(describing: pow(10,indexPath.row))
        cell.delegate = self
        return cell
    }
    
    
    func minusbuttonpressed(val: Int) {
        sum = sum - val
        sumlabel.text = "Total: \(sum)"
    }
    
    func plusbuttonpressed(val: Int) {
        sum = sum + val
        sumlabel.text = "Total: \(sum)"
    }
    
}

