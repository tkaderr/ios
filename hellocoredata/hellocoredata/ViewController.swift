//
//  ViewController.swift
//  hellocoredata
//
//  Created by Tahim Kader on 5/13/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBAction func saveuser(_ sender: UIButton) {
        let user = User(context: managedObjectContext)
        
        user.firstname = "Bob"
        user.email = "Bob@bobmail.com"
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Success!")
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        do {
            let userRequest = try managedObjectContext.fetch(User.fetchRequest())
            userRequest.forEach {
                user in
                print(user.email!, user.firstName!)
            }
        } catch {
            print("Error: \(error)")
        
        }
       
    }


}

