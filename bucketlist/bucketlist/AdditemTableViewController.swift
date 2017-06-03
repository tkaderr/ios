//
//  AdditemTableViewController.swift
//  bucketlist
//
//  Created by Tahim Kader on 5/16/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class AdditemTableViewController: UITableViewController {
    
    weak var delegate: AdditemTableViewControllerDelegate?
    var indexPath: NSIndexPath?
    var item: String?
    
    
    
    @IBOutlet weak var itemTextField: UITextField!
    
    
    
    @IBAction func cancelbutton(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }

    @IBAction func savebutton(_ sender: UIBarButtonItem) {
        
        delegate?.itemSaved(by: self, with: itemTextField.text!, at: indexPath)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextField.text = item


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
