//
//  ViewController.swift
//  tipster
//
//  Created by Tahim Kader on 5/10/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valuelabel: UILabel!
    @IBOutlet weak var decimallabel: UIButton!

    @IBOutlet weak var minperlabel: UILabel!
    @IBOutlet weak var medperlabel: UILabel!
    @IBOutlet weak var maxperlabel: UILabel!
    
    @IBOutlet weak var mintiplabel: UILabel!
    @IBOutlet weak var medtiplabel: UILabel!
    @IBOutlet weak var maxtiplabel: UILabel!
    
    @IBOutlet weak var mingrouplabel: UILabel!
    @IBOutlet weak var medgrouplabel: UILabel!
    @IBOutlet weak var maxgrouplabel: UILabel!
    
    @IBOutlet weak var tipsliderlabel: UISlider!
    @IBOutlet weak var groupsliderlabel: UISlider!
    @IBOutlet weak var groupsizelabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valuelabel.text = "0"
        minperlabel.text = String(Int(tipsliderlabel.value)+4) + "%"
        medperlabel.text = String(Int(tipsliderlabel.value)+9) + "%"
        maxperlabel.text = String(Int(tipsliderlabel.value)+14) + "%"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonpressed(_ sender: UIButton) {
        
        if sender.tag < 10 {
            let currvalue = sender.tag
            if valuelabel.text == "0" {
                valuelabel.text = String(currvalue)
                numCheck()
            }
            else {
                valuelabel.text = valuelabel.text! + String(currvalue)
                numCheck()
            }
        }
        else if sender.tag == 10{
            valuelabel.text = valuelabel.text! + "."
            decimallabel.isEnabled = false
        }
        else if sender.tag == 11{
            valuelabel.text = "0"
            decimallabel.isEnabled = true
            tipsliderlabel.value = 0
            groupsliderlabel.value = 1
            minperlabel.text = String(Int(tipsliderlabel.value)+4) + "%"
            medperlabel.text = String(Int(tipsliderlabel.value)+9) + "%"
            maxperlabel.text = String(Int(tipsliderlabel.value)+14) + "%"
        }
    }
    
    
    @IBAction func tipslider(_ sender: UISlider) {
        minperlabel.text = String(Int(tipsliderlabel.value)+4) + "%"
        medperlabel.text = String(Int(tipsliderlabel.value)+9) + "%"
        maxperlabel.text = String(Int(tipsliderlabel.value)+14) + "%"
        numCheck()
    }
    
    @IBAction func groupslider(_ sender: UISlider) {
        groupsizelabel.text = String(Int(groupsliderlabel.value))
        numCheck()
    }
    
    
    func numCheck(){
        if let totallabel = valuelabel.text {
            let input = Float(totallabel)
            let min: Float = (Float((tipsliderlabel.value + 4)/Float(100)))
            let med: Float = (Float((tipsliderlabel.value + 9)/100))
            let max: Float = (Float((tipsliderlabel.value + 14)/100))
            mintiplabel.text = String(input! * min)
            medtiplabel.text = String(input! * med)
            maxtiplabel.text = String(input! * max)
            mingrouplabel.text = String(input! * min/Float(groupsliderlabel.value))
            medgrouplabel.text = String(input! * med/Float(groupsliderlabel.value))
            maxgrouplabel.text = String(input! * max/Float(groupsliderlabel.value))
            
            
            
//            let input = Double(totallabel)
//            let min = Double((Int(tipsliderlabel.value * 100)+4)/100)
//            let med = Double((Int(tipsliderlabel.value * 100)+9)/100)
//            let max = Double((Int(tipsliderlabel.value * 100)+14)/100)
//            mintiplabel.text = String(input! * min)
//            medtiplabel.text = String(input! * med)
//            maxtiplabel.text = String(input! * max)
//            mingrouplabel.text = String(input! * min/Double(groupsliderlabel.value))
//            medgrouplabel.text = String(input! * med/Double(groupsliderlabel.value))
//            maxgrouplabel.text = String(input! * max/Double(groupsliderlabel.value))
        }
    }
    

}

