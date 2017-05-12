//
//  ViewController.swift
//  Example
//
//  Created by Tahim Kader on 5/9/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rightimageview: UIImageView!
    @IBOutlet weak var leftimageview: UIImageView!
    @IBOutlet weak var leftscorelabel: UILabel!
    @IBOutlet weak var rightscorelabel: UILabel!
    var rightscore = 0
    var leftscore = 0
    
    var arr = ["card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king", "ace"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dealtapped(_ sender: Any) {
        let randone = Int(arc4random_uniform(13))
        let randtwo = Int(arc4random_uniform(13))
        
        leftimageview.image = UIImage(named: (arr[randone]))
        rightimageview.image = UIImage(named: (arr[randtwo]))
        
        if randone > randtwo {
            leftscore += 1
            leftscorelabel.text = String(leftscore)
        }
        else if randtwo > randone {
            rightscore += 1
            rightscorelabel.text = String(rightscore)
        }
    }

}

