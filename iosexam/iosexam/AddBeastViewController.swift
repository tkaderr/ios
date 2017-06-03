//
//  AddBeastViewController.swift
//  iosexam
//
//  Created by Tahim Kader on 5/25/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
import UIKit

class AddBeastViewController: UIViewController {
    
   
    var item: String?
    var ip: NSIndexPath?

    
    var delegate:BeastDelegate?
    
    @IBOutlet weak var textfield: UITextField!
    
    
    @IBAction func cancelbutton(_ sender: UIBarButtonItem) {
        delegate?.cancelbuttonpressed(by: self)
        
    }
    
    
    @IBAction func donebutton(_ sender: UIBarButtonItem) {
        let text = textfield.text!
        delegate?.savebuttonpressed(by: self, text: text, path: ip)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.text = item
    }
}
