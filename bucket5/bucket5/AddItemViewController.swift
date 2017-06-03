//
//  AddItemViewController.swift
//  bucket5
//
//  Created by Tahim Kader on 5/20/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    var delegate: AddItemViewControllerDelegate?
    
    var texter: String?
    var pathway: NSIndexPath?
    
    @IBOutlet weak var textfield: UITextField!
    
    
    @IBAction func cancelbutton(_ sender: UIBarButtonItem) {
        delegate?.cancebuttonpressed(by: self)
    }
    
    
    @IBAction func savebutton(_ sender: UIBarButtonItem) {
        if let text = textfield.text{
            delegate?.savebuttonpressed(by: self, text: text, path: pathway)
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
