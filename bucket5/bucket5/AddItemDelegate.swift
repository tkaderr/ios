//
//  AddItemDelegate.swift
//  bucket5
//
//  Created by Tahim Kader on 5/20/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemViewControllerDelegate: class {
    func cancebuttonpressed(by contoller: UIViewController)
    func savebuttonpressed(by controller: UIViewController, text: String, path: NSIndexPath?)
}
