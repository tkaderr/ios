//
//  CreationViewController.swift
//  madlib2
//
//  Created by Tahim Kader on 5/17/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    
    @IBOutlet weak var firsttext: UITextField!
    @IBOutlet weak var secondtext: UITextField!
    @IBOutlet weak var thirdtext: UITextField!
    @IBOutlet weak var fourthtext: UITextField!
    
    var delegate: CreationDelegate?
    var arr = [String]()
    
    
    @IBAction func cancelbutton(_ sender: UIBarButtonItem) {
        delegate?.cancelbuttonpressed(controller:self)
    }
    
  
    @IBAction func savebutton(_ sender: UIBarButtonItem) {
        arr.append(firsttext.text!)
        arr.append(secondtext.text!)
        arr.append(thirdtext.text!)
        arr.append(fourthtext.text!)
    
        delegate?.savebuttonpressed(controller:self, text: arr)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
