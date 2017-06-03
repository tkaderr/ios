//
//  AddItemViewController.swift
//  todo2
//
//  Created by Tahim Kader on 5/23/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var currtitle: UITextField!
    @IBOutlet weak var descript: UITextView!
    @IBOutlet weak var date: UIDatePicker!
    
    var delegate: customcelldelegate?
    
    
    
    @IBAction func cancelbutton(_ sender: UIBarButtonItem) {
        delegate?.cancelbuttonpressed(by: self)
    }
    
    @IBAction func savebutton(_ sender: UIButton) {
        let title = currtitle.text!
        let description = descript.text!
        let setdate = date.date
        delegate?.savebuttonpressed(by: self, title: title, descrip: description, date: setdate)
    }
    
    
}
