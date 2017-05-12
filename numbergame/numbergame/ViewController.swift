//
//  ViewController.swift
//  numbergame
//
//  Created by Tahim Kader on 5/11/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var randnum = 0
    
    @IBOutlet weak var userinput: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        randnum = Int(arc4random_uniform(101)+1)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func answersubmit(_ sender: UIButton) {
        let answer = Int(userinput.text!)
        if answer == randnum {
            displayAlert(usermessage: "You win")
        }
        else if answer! < randnum {
            displayAlert(usermessage: "Number is too low")
        }
        else {
            displayAlert(usermessage: "Number is too high")
        }
        
    }
    
    
    func displayAlert(usermessage: String){
        
        if usermessage == "You win"  {
            var myAlert = UIAlertController(title: "Correct", message: usermessage, preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: { (action:UIAlertAction) in
                self.randnum = 0
                self.randnum = Int(arc4random_uniform(101)+1)
                self.userinput.text = ""
                
            })
            
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated:true, completion:nil)
        }
        
        else if usermessage == "Number is too low" {
            
            var myAlert = UIAlertController(title: "Incorrect", message: usermessage, preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive, handler:nil)
            
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated:true, completion:nil)
        }
        
        else if usermessage == "Number is too high" {
            var myAlert = UIAlertController(title: "Incorrect", message: usermessage, preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.destructive, handler:nil)
            
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated:true, completion:nil)
        }
    }


    
    
}

