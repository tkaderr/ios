//
//  ViewController.swift
//  ninjagold2
//
//  Created by Tahim Kader on 5/10/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scorelabel: UILabel!
    @IBOutlet weak var textlabel: UILabel!
    var rand = 0
    var score = 0
    
    @IBAction func coinbutton(_ sender: UIButton) {
        if sender.tag == 1 {
            rand = Int(arc4random_uniform(6)+5)
            score = score + rand
            scorelabel.text = String(score)
            textlabel.text = "You won \(rand) gold"
        }
        else if sender.tag == 2{
            rand = Int(arc4random_uniform(4)+2)
            score = score + rand
            scorelabel.text = String(score)
            textlabel.text = "You won \(rand) gold"
        }
        else if sender.tag == 3 {
            rand = Int(arc4random_uniform(11)+10)
            score = score + rand
            scorelabel.text = String(score)
            textlabel.text = "You won \(rand) gold"
        }
        else if sender.tag == 4 {
            rand = Int(arc4random_uniform(51)-arc4random_uniform(51))
            score = score + rand
            scorelabel.text = String(score)
            if rand >= 0 {
                textlabel.text = "You won \(rand) gold"
            }
            else {
                textlabel.text = "You lost \(rand) gold"
            }
        }
    }

    @IBAction func resetbutton(_ sender: UIButton) {
        textlabel.text = "Click to play"
        score = 0
        scorelabel.text = String(score)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textlabel.text = "Click to play"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

