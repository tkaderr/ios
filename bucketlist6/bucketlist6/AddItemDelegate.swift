//
//  AddItemDelegate.swift
//  bucketlist6
//
//  Created by Tahim Kader on 5/23/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemDelegate: class {
    func cancelbuttonpressed(by controller: UIViewController)
    func savebuttonpressed(by controller: UIViewController, text: String, path: NSIndexPath?)
}
