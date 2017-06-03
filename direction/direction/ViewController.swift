//
//  ViewController.swift
//  direction
//
//  Created by Tahim Kader on 5/17/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
    }
    
    @IBAction func buttonpressed(_ sender: UIButton) {
        performSegue(withIdentifier: "directional", sender: sender)
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let x = segue.destination as! DirectionViewController
        if(sender is UIButton){
           let button = sender as! UIButton
            x.text = button.title(for: .normal)
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
    
    

}

