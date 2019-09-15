//
//  partIIViewController.swift
//  lab1
//
//  Created by Janaka Balasooriya on 8/28/19.
//  Copyright © 2019 Janaka Balasooriya. All rights reserved.
//

import UIKit

class partIIViewController: UIViewController {
    
    
    @IBOutlet weak var wValLabel: UILabel!
    @IBOutlet weak var hValLabel: UILabel!
    
    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var wLabel: UILabel!
    @IBOutlet weak var gLabel: UILabel!
    @IBOutlet weak var rfm2Label: UILabel!
    @IBOutlet weak var rfmnum2Label: UILabel!
    @IBOutlet weak var healthy2Label: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var waistSlider: UISlider!
    @IBOutlet weak var genderSeg: UISegmentedControl!
    var RFM = Double()
    var heightSliderVal = Float()
    var waistSliderVal = Float()
   // var genderSegVal = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func getHeightSliderVal(_ sender: Any) {
        
       heightSliderVal = self.heightSlider.value
       heightSliderVal.round()
       self.hValLabel.text = String(heightSliderVal)
    }
    
    @IBAction func getWaistSliderVal(_ sender: Any) {
        waistSliderVal = self.waistSlider.value
        waistSliderVal.round()
        self.wValLabel.text = String(waistSliderVal)
    }
    
    
    @IBAction func getGenderSeg(_ sender: Any) {
        
       var genderSegVal = self.genderSeg.selectedSegmentIndex
       self.rfmnum2Label.text = String(genderSegVal)
        
        var rfmPT1 = Float()
        
        if(genderSegVal == 0){
            rfmPT1 = heightSlider.value/waistSlider.value
            RFM = Double((64-(20*(rfmPT1)))+12)
        }
        else if(genderSegVal ==  1){
            RFM = Double((64-(20*(heightSlider.value/waistSlider.value))))
        }
        else{
            RFM = 0.0
        }
        rfmnum2Label.text = String(format: "%.2f", RFM)
        
        if(genderSegVal == 1){
            if(RFM <= 11){
                healthy2Label.text = "Underfat"
                healthy2Label.textColor = UIColor.blue
            }
            else if (RFM > 11 && RFM <= 22){
                healthy2Label.text = "Healthy"
                healthy2Label.textColor = UIColor.green
            }
            else if (RFM > 22 && RFM <= 28){
                healthy2Label.text = "Overfat"
                healthy2Label.textColor = UIColor.yellow
            }
            else if (RFM > 28){
                healthy2Label.text = "Obese"
                healthy2Label.textColor = UIColor.red
            }
        }
        else if (genderSegVal == 0){
            if(RFM <= 23){
                healthy2Label.text = "Underfat"
                healthy2Label.textColor = UIColor.blue
            }
            else if (RFM > 23 && RFM <= 35){
                healthy2Label.text = "Healthy"
                healthy2Label.textColor = UIColor.green
            }
            else if (RFM > 35 && RFM <= 40 ){
                healthy2Label.text = "Overfat"
                healthy2Label.textColor = UIColor.yellow
            }
            else if (RFM > 40){
                healthy2Label.text = "Obese"
                healthy2Label.textColor = UIColor.red
            }
        }
    }
    /*
     var RFM = Double()
     
     if(genderText == "M"){
     RFM = 64-(20*(h/w))
     }
     else if(genderText == "F"){
     RFM = (64-(20*(h/w))+(12))
     }
     else{
     RFM = 0.0
     }
     
     rfmnumLabel.text = String(RFM)
     
     if(genderText == "M"){
     if(RFM <= 11){
     healthyLabel.text = "Underfat"
     healthyLabel.textColor = UIColor.blue
     }
     else if (RFM > 11 && RFM <= 22){
     healthyLabel.text = "Healthy"
     healthyLabel.textColor = UIColor.green
     }
     else if (RFM > 22 && RFM <= 28){
     healthyLabel.text = "Overfat"
     healthyLabel.textColor = UIColor.yellow
     }
     else if (RFM > 28){
     healthyLabel.text = "Obese"
     healthyLabel.textColor = UIColor.red
     }
     }
     else if (genderText == "F"){
     if(RFM <= 23){
     healthyLabel.text = "Underfat"
     healthyLabel.textColor = UIColor.blue
     }
     else if (RFM > 23 && RFM <= 35){
     healthyLabel.text = "Healthy"
     healthyLabel.textColor = UIColor.green
     }
     else if (RFM > 35 && RFM <= 40 ){
     healthyLabel.text = "Overfat"
     healthyLabel.textColor = UIColor.yellow
     }
     else if (RFM > 40){
     healthyLabel.text = "Obese"
     healthyLabel.textColor = UIColor.red
     }
     }
  */
}
