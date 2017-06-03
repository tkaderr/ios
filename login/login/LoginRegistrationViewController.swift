//
//  ViewController.swift
//  login
//
//  Created by Tahim Kader on 5/24/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit
import CoreData

class LoginRegistrationViewController: UIViewController, LoginDelegate {
    
    var jsonObject : [Dictionary<String,Any>]?
    var serverdata = ServerData()
    
    
    @IBOutlet weak var emaillabel: UITextField!
    
    @IBOutlet weak var passwordlabel: UITextField!
    
    var userArr = [String]()
    
    
    func createArray(jsonobj : [Dictionary<String,Any>]?){
        jsonObject = jsonobj
        if (jsonObject != nil) {
            print("success")
        }
        else {
            let myAlert = UIAlertController(title: "Email/Password Incorrect", message: "Please re-enter email and password.", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive, handler:nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil)
            print(userArr.count)
        }
    }
    
    @IBAction func loginbutton(_ sender: UIButton) {
        if emaillabel.text == "" {
                var myAlert = UIAlertController(title: "Email Incorrect", message: "Please enter a valid Email.", preferredStyle: UIAlertControllerStyle.alert)
                let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive, handler:nil)
                myAlert.addAction(okAction)
                self.present(myAlert, animated:true, completion:nil)
        }
        else if passwordlabel.text == ""{
            var myAlert = UIAlertController(title: "Password Incorrect", message: "Please enter respective password.", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.destructive, handler:nil)
            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil)
        }
        let loginArr = [emaillabel.text, passwordlabel.text]
        serverdata.postData(user: loginArr as! [String], url: "http://34.210.30.131/login"){jsonObj in self.createArray(jsonobj: jsonObj)}
    }
    
    @IBAction func signupbutton(_ sender: UIButton) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigation = segue.destination as! UINavigationController
        let controller = navigation.topViewController as! SignUpViewController
        controller.delegate = self
    }
    
    
    func cancelbuttonpressed(by controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func signupbuttonpressed(by controller: UIViewController, userdata: [String]) {
//        serverdata.postData(user: userdata as! [String], url: "http://localhost:8000/login"){jsonObj in self.createArray(jsonobj: jsonObj)}
        emaillabel.text = userdata[2]
        passwordlabel.text = userdata[3]
        dismiss(animated: true, completion: nil)
    }
    
}

