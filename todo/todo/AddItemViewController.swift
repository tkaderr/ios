//
//  ViewController.swift
//  todo
//
//  Created by Tahim Kader on 5/21/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    var delegate: AddItemDelegate?
    
    var date: Date?
    
    @IBOutlet weak var titlelabel: UITextField!
    
    @IBOutlet weak var descriptionlabel: UITextView!
    
    
    @IBOutlet weak var datelabel: UIDatePicker!
    
    
    @IBAction func cancelbutton(_ sender: UIBarButtonItem) {
        delegate?.cancelbuttonpressed(by: self)
    }
    
    @IBAction func savebutton(_ sender: UIBarButtonItem) {
        let title = titlelabel.text!
        let desc = descriptionlabel.text!
        let date = datelabel.date 
        delegate?.savebuttonpressed(by: self, title:title, desc: desc, date: date)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
