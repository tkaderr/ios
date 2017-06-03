//
//  DirectionViewController.swift
//  direction
//
//  Created by Tahim Kader on 5/17/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class DirectionViewController: UIViewController {

    @IBOutlet weak var directiontext: UILabel!
    
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(text)
        directiontext.text = text
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbutton(_ sender: UIButton) {
        performSegue(withIdentifier: "goback", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
