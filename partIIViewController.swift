//
//  partIIViewController.swift
//  lab1
//
//  Created by Janaka Balasooriya on 8/28/19.
//  Copyright © 2019 Janaka Balasooriya. All rights reserved.
//

import UIKit

class partIIViewController: UIViewController {
    
    //drag and drop labels and text fields from main storyboard
    
    
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
    
    @IBAction func getHeightSliderVal(_ sender: Any) {   //gets height slider value and updates as user moves it
        
       heightSliderVal = self.heightSlider.value
       heightSliderVal.round()
       self.hValLabel.text = String(heightSliderVal)
    }
    
    @IBAction func getWaistSliderVal(_ sender: Any) {   //gets waist slider value and updates as user moves it
        waistSliderVal = self.waistSlider.value
        waistSliderVal.round()
        self.wValLabel.text = String(waistSliderVal)
    }
    
    
    @IBAction func getGenderSeg(_ sender: Any) {        //gets gender value from segemented controller. 0 = female and 1 = male
        
       var genderSegVal = self.genderSeg.selectedSegmentIndex
       self.rfmnum2Label.text = String(genderSegVal)
        
        var rfmPT1 = Float()
        
        if(genderSegVal == 0){                           //formula for a female's RFM
            rfmPT1 = heightSlider.value/waistSlider.value
            RFM = Double((64-(20*(rfmPT1)))+12)
        }
        else if(genderSegVal ==  1){                    //formula for a male's RFM
            RFM = Double((64-(20*(heightSlider.value/waistSlider.value))))
        }
        else{
            RFM = 0.0
        }
        rfmnum2Label.text = String(format: "%.2f", RFM) 
        
        if(genderSegVal == 1){                         //prints out user's fat mass category based on input
            if(RFM <= 11){
                healthy2Label.text = "Underfat"        //for males
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
        else if (genderSegVal == 0){              //for females
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
}
