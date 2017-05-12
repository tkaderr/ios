//
//  ViewController.swift
//  tictactoe
//
//  Created by Tahim Kader on 5/10/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerlabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    var colors = ["grey", "grey", "grey", "grey", "grey", "grey", "grey", "grey", "grey"]
    var turn = 1
    
    
    
    @IBAction func buttonpressed(_ sender: UIButton) {
        winnerlabel.isHidden = true
        let check = notPresed(color: sender.tag)
        if check == true {
            if turn == 1{
                sender.backgroundColor = UIColor.red
                colors[sender.tag] = "red"
                turn = 2
                gameCheck(color: "red")
            }
            else{
                sender.backgroundColor = UIColor.blue
                colors[sender.tag] = "blue"
                turn = 1
                gameCheck(color: "blue")
            }
        }
        else{
            winnerlabel.isHidden = false
            winnerlabel.text = "Please select a grey square"
        }
        
    }
    
    
    func notPresed(color: Int) -> Bool {
        if colors[color] == "grey" {
            return true
        }
        else if colors[color] == "blue" || colors[color] == "red" {
            return false
        }
        return false
    }
    
    func gameCheck(color: String){
        if colors[0] == color && colors[4] == color && colors[8] == color {
            winnerlabel.isHidden = false
            winnerlabel.text = "The winner is \(color)!"
        }
        if colors[0] == color && colors[3] == color && colors[6] == color {
            winnerlabel.isHidden = false
            winnerlabel.text = "The winner is \(color)!"
        }
        if colors[1] == color && colors[4] == color && colors[7] == color {
            winnerlabel.isHidden = false
            winnerlabel.text = "The winner is \(color)!"
        }
        if colors[2] == color && colors[4] == color && colors[6] == color {
            winnerlabel.isHidden = false
            winnerlabel.text = "The winner is \(color)!"
        }
        if colors[3] == color && colors[4] == color && colors[5] == color {
            winnerlabel.isHidden = false
            winnerlabel.text = "The winner is \(color)!"
        }
        if colors[6] == color && colors[7] == color && colors[8] == color {
            winnerlabel.isHidden = false
            winnerlabel.text = "The winner is \(color)!"
        }
        if colors[0] == color && colors[1] == color && colors[2] == color {
            winnerlabel.isHidden = false
            winnerlabel.text = "The winner is \(color)!"
        }
        if colors[2] == color && colors[5] == color && colors[8] == color {
            winnerlabel.isHidden = false
            winnerlabel.text = "The winner is \(color)!"
        }
    }
    
    @IBAction func resetbutton(_ sender: UIButton) {
        button1.backgroundColor = UIColor.gray
        button2.backgroundColor = UIColor.gray
        button3.backgroundColor = UIColor.gray
        button4.backgroundColor = UIColor.gray
        button5.backgroundColor = UIColor.gray
        button6.backgroundColor = UIColor.gray
        button7.backgroundColor = UIColor.gray
        button8.backgroundColor = UIColor.gray
        button9.backgroundColor = UIColor.gray
        winnerlabel.isHidden = true
        turn = 1
        colors = ["grey", "grey", "grey", "grey", "grey", "grey", "grey", "grey", "grey"]
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        winnerlabel.isHidden = true
    }


}

