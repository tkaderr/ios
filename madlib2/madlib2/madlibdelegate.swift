//
//  madlibdelegate.swift
//  madlib2
//
//  Created by Tahim Kader on 5/17/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
import UIKit

protocol CreationDelegate: class {
    func cancelbuttonpressed(controller: UIViewController)
    func savebuttonpressed(controller: UIViewController, text: [String])
}
