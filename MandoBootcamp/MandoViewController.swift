//
//  MandoViewController.swift
//  MandoBootcamp
//
//  Created by user on 9/5/18.
//  Copyright © 2018 Mar Balibrea Rull. All rights reserved.
//

import UIKit

class MandoViewController: UIViewController {
    
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var coldImage: UIImageView!
    @IBOutlet weak var hotImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var tempUnitLabel: UILabel!
    @IBOutlet weak var ecoImage: UIImageView!
    @IBOutlet weak var line1VelocityView: UIView!
    @IBOutlet weak var line2VelocityView: UIView!
    @IBOutlet weak var line3VelocityView: UIView!
    @IBOutlet weak var line4VelocityView: UIView!
    @IBOutlet weak var line1BatteryView: UIView!
    @IBOutlet weak var line2BatteryView: UIView!
    @IBOutlet weak var line3BatteryView: UIView!
    @IBOutlet weak var line4BatteryView: UIView!
    @IBOutlet weak var line5BatteryView: UIView!
    @IBOutlet weak var hourStartLabel: UILabel!
    @IBOutlet weak var hourEndLabel: UILabel!
    
    var velocity = 2;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.blueView.backgroundColor = UIColor(red: 37/255.0, green: 174/255.0, blue: 255/255.0, alpha: 1.0)
        self.coldImage.isHidden = false
        self.hotImage.isHidden = true

        self.line1VelocityView.isHidden = false
        self.line2VelocityView.isHidden = false
        self.line3VelocityView.isHidden = true
        self.line4VelocityView.isHidden = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func lightButton(_ sender: UIButton) {
        if self.blueView.tag == 0 { //encendido
            self.blueView.backgroundColor = UIColor(red: 108/255.0, green: 123/255.0, blue: 145/255.0, alpha: 1.0)
            self.blueView.tag = 1
        } else if self.blueView.tag == 1 { //apagado
            self.blueView.backgroundColor = UIColor(red: 37/255.0, green: 174/255.0, blue: 255/255.0, alpha: 1.0)
            self.blueView.tag = 0
        }
    }
    @IBAction func onoffButton(_ sender: UIButton) {
    }
    @IBAction func modeButton(_ sender: UIButton) {
        if self.coldImage.isHidden {
            self.coldImage.isHidden = false
            self.hotImage.isHidden = true
        } else {
            self.coldImage.isHidden = true
            self.hotImage.isHidden = false
        }
    }
    @IBAction func fanButton(_ sender: UIButton) {
        
    }
    @IBAction func tempUpButton(_ sender: UIButton) {
    }
    @IBAction func tempDownButton(_ sender: UIButton) {
    }
    @IBAction func directionButton(_ sender: UIButton) {
    }
    @IBAction func movingButton(_ sender: UIButton) {
    }
    @IBAction func setButton(_ sender: UIButton) {
    }
    
    
    
    
    
}
