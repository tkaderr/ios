//
//  AddItemTableViewControllerDelegate.swift
//  bucketlist
//
//  Created by Tahim Kader on 5/16/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import Foundation
protocol AdditemTableViewControllerDelegate: class {

    func itemSaved(by controller: AdditemTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AdditemTableViewController)
}
