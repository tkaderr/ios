//
//  ViewController.swift
//  coldcall
//
//  Created by Tahim Kader on 5/10/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var namelabel: UILabel!
    
    @IBOutlet weak var coldcalllabel: UIButton!
    @IBOutlet weak var numberlabel: UILabel!
    
    var namearr = ["Jay", "Bryant", "John", "Bob", "Billy"]
    
    @IBAction func coldcallbutton(_ sender: UIButton) {
        numberlabel.isHidden = false
        let randint = Int(arc4random_uniform(5))
        let randnum = Int(arc4random_uniform(5)+1)
        namelabel.text = namearr[randint]
        numberlabel.text = String(randnum)
        if randnum < 3 {
            numberlabel.textColor = UIColor.red
        }
        else if randnum > 2 && randnum < 5 {
            numberlabel.textColor = UIColor.orange
        }
        else {
            numberlabel.textColor = UIColor.green
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        namelabel.text = "Ready?"
        coldcalllabel.backgroundColor = UIColor.blue
        numberlabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

