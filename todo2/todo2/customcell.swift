//
//  customcell.swift
//  todo2
//
//  Created by Tahim Kader on 5/23/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
import UIKit



protocol customcelldelegate: class {
    func cancelbuttonpressed(by controller: UIViewController)
    func savebuttonpressed(by controller: UIViewController, title: String, descrip: String, date: Date)
}


class customcell: UITableViewCell {
    @IBOutlet weak var titlelabel: UILabel!
    
    @IBOutlet weak var descriptionlabel: UILabel!
    
    @IBOutlet weak var datelabel: UILabel!
    
}
