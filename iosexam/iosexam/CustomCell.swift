//
//  CustomCell.swift
//  iosexam
//
//  Created by Tahim Kader on 5/25/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    var delegate: IsBeastDelegate?
    
    @IBOutlet weak var buttonlabel: UIButton!
    
    @IBAction func beastbutton(_ sender: UIButton) {
        print(sender.tag)
        let path = sender.tag
        delegate?.beastbuttonpressed(by: self, path:path)
    }
    
    @IBOutlet weak var beastlabel: UILabel!
    
}
