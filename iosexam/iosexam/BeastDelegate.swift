//
//  BeastDelegate.swift
//  iosexam
//
//  Created by Tahim Kader on 5/25/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//


import Foundation
import UIKit

protocol BeastDelegate: class {
    func cancelbuttonpressed(by controller: UIViewController)
    func savebuttonpressed(by controller: UIViewController, text: String, path: NSIndexPath?)
}

protocol IsBeastDelegate: class {
    func beastbuttonpressed(by controller: UITableViewCell, path: Int)
}
