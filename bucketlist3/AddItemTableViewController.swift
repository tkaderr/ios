//
//  AddItemTableViewController.swift
//  bucketlist3
//
//  Created by Tahim Kader on 5/17/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
    
    @IBOutlet weak var textfield: UITextField!
    weak var delegate: AddItemTableViewControllerDelegate?
    var item: String?
    var indexPath: NSIndexPath?
    
    

    @IBAction func cancelbuttonpressed(_ sender: UIBarButtonItem) {
        delegate?.cancelbuttonpressed(by:self)
    }
    
    
    
    @IBAction func savebuttonpressed(_ sender: UIBarButtonItem) {
        if let text = textfield.text {
            delegate?.savebuttonpressed(by:self, text: text, path: indexPath)
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.text = item

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

  
    

}
