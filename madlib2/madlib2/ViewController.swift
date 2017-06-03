//
//  ViewController.swift
//  madlib2
//
//  Created by Tahim Kader on 5/17/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CreationDelegate {

    @IBOutlet weak var madlibtext: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        madlibtext.text = "Select Compose..."
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let madlib = segue.destination as! UINavigationController
        let creation = madlib.topViewController as! CreationViewController
        creation.delegate = self
    }
    
    
    func cancelbuttonpressed(controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func savebuttonpressed(controller: UIViewController, text: [String]) {
        madlibtext.text = "We are having a perfectly \(text[0]) time now. Later we will \(text[1]) and \(text[2]) in the \(text[3])."
        dismiss(animated: true, completion: nil)
    }


}

