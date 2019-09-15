//
//  partIViewController.swift
//  lab1
//
//  Created by Janaka Balasooriya on 8/28/19.
//  Copyright © 2019 Janaka Balasooriya. All rights reserved.
//

import UIKit

class partIViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightTF: UITextField!
    @IBOutlet weak var waistLabel: UILabel!
    @IBOutlet weak var waistTF: UITextField!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderTF: UITextField!
    @IBOutlet weak var rfmLabel: UILabel!
    @IBOutlet weak var rfmnumLabel: UILabel!
    @IBOutlet weak var healthyLabel: UILabel!
    
    
   // var heightText = String()
    //var waistText = String()
    var genderText = String()
// var RFM = Double()
    // 64 − (20×(height/waist))+(12×gender),
    //where gender = 0 for
   // men and 1 for women
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func calcRFMbutton(_ sender: Any) {
        
        let h = Double(heightTF.text!) ?? 0
        let w = Double(waistTF.text!) ?? 1
        genderText = genderTF.text!
        
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
        
       rfmnumLabel.text = String(format: "%.f", RFM)
        
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
        //if(RFM)
        //rfmnumLabel.text = heightText
    }
    
    //
    //  ViewController.swift
    //  lab1
    //
    //  Created by Nihal Mandava on 9/4/19.
    //  Copyright © 2019 Nihal Mandava. All rights reserved.
    //
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
