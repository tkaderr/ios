//
//  AddItemDelegate.swift
//  todo
//
//  Created by Tahim Kader on 5/21/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemDelegate: class {
    func cancelbuttonpressed(by controller: UIViewController)
    func savebuttonpressed(by controller: UIViewController, title: String, desc: String, date: Date)
}
