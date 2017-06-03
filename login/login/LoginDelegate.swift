//
//  LoginDelegate.swift
//  login
//
//  Created by Tahim Kader on 5/24/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
import UIKit

protocol LoginDelegate: class {
    func cancelbuttonpressed(by controller: UIViewController)
    func signupbuttonpressed(by controller: UIViewController, userdata: [String])
}
