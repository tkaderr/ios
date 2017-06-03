//
//  AddItemViewDelegate.swift
//  bucketlist3
//
//  Created by Tahim Kader on 5/17/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemTableViewControllerDelegate: class {
    func cancelbuttonpressed(by controller: AddItemTableViewController)
    func savebuttonpressed(by controller: AddItemTableViewController, text: String, path: NSIndexPath?)
}


