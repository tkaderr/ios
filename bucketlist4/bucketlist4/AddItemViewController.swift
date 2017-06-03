//
//  AddItemViewController.swift
//  bucketlist4
//
//  Created by Tahim Kader on 5/17/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    //link the textfield
    @IBOutlet weak var textfield: UITextField!
    
    //variables that will be used to pass data from one scene to another
    var texter: String?
    var indexpat: NSIndexPath?
    
    //establish delegate variable
    var delegate: AddItemViewControllerDelegate?
    
    
    //Code that will execute when the cancel button is selected
    @IBAction func cancelbutton(_ sender: UIBarButtonItem) {
        delegate?.cancelbuttonpressed(controller: self)
    }
    
    //Code that will execute when the save button is selected
    @IBAction func savebutton(_ sender: UIBarButtonItem) {
        if let text = textfield.text {
            delegate?.savebuttonpressed(controller: self, text: text, path: indexpat)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.text = texter

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
