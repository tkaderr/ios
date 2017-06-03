//
//  AddItemDelegate.swift
//  bucketlist4
//
//  Created by Tahim Kader on 5/17/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
import UIKit


//Create delegate to deal with cancel and save button on the additem page
protocol AddItemViewControllerDelegate: class {
    func cancelbuttonpressed(controller: UIViewController)
    func savebuttonpressed(controller: UIViewController, text:String, path: NSIndexPath?)
}
