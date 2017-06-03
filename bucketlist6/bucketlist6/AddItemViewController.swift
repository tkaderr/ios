//
//  AddItemViewController.swift
//  bucketlist6
//
//  Created by Tahim Kader on 5/23/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController: UIViewController {
    
    var delegate: AddItemDelegate?
    
    var item: String?
    var ip: NSIndexPath?
    
    @IBOutlet weak var textfield: UITextField!
    
    
    @IBAction func savebutton(_ sender: UIBarButtonItem) {
        let text = textfield.text!
        delegate?.savebuttonpressed(by: self, text: text, path: ip)
    }
    
    @IBAction func cancelbutton(_ sender: UIBarButtonItem) {
        delegate?.cancelbuttonpressed(by: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.text = item
    }
}
