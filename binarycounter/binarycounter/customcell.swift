//
//  customcell.swift
//  binarycounter
//
//  Created by Tahim Kader on 5/22/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
import UIKit



protocol CustomCellDelegate: class {
    func minusbuttonpressed(val: Int)
    func plusbuttonpressed(val: Int)
}



class CustomCell: UITableViewCell {
    
    @IBOutlet weak var valuelabel: UILabel!
    
    var delegate: CustomCellDelegate?
    
    
    @IBAction func plusbutton(_ sender: UIButton) {
        let val = Int(valuelabel.text!)
        delegate?.plusbuttonpressed(val: val!)
    }
    
    
    @IBAction func minusbutton(_ sender: UIButton) {
        let val = Int(valuelabel.text!)
        delegate?.minusbuttonpressed(val: val!)
    }
    
}
