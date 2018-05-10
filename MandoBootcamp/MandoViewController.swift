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
    var velocity = 1 //2 arriba 2 abajo
    var velocitys = [UIView]()
    
    var battery = 4 //todos arriba
    var batterys = [UIView]()
    
    var isOn = true
    
    var batteryTimer:Timer!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.blueView.backgroundColor = UIColor(red: 37/255.0, green: 174/255.0, blue: 255/255.0, alpha: 1.0)
        self.coldImage.isHidden = false
        self.hotImage.isHidden = true

        self.velocitys = [line1VelocityView, line2VelocityView, line3VelocityView, line4VelocityView]
        self.velocitys[0].isHidden = false
        self.velocitys[1].isHidden = false
        self.velocitys[2].isHidden = true
        self.velocitys[3].isHidden = true

        AireAcondicionado.AAcontroller.onOff()
        
        self.batterys = [line1BatteryView, line2BatteryView, line3BatteryView, line4BatteryView, line5BatteryView]
        for views in self.batterys {
            views.isHidden = false
        }
        
        self.tempLabel.text = "24"
        AireAcondicionado.AAcontroller.setTemuser(tem: Int(self.tempLabel.text!)!)
        
        self.batteryTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(updateBattery(data:)), userInfo: "", repeats: true)
        
        pickerData = ["00:00", "01:00", "02:00", "03:00", "04:00","05:00", "00:00", "00:00", "00:00","00:00", "00:00", "00:00", "00:00","00:00", "00:00", "00:00", "00:00","00:00", "00:00", "00:00", "00:00"]

    }

    @objc private func updateBattery(data:Timer) {
        if self.battery == 0 {
            self.blueView.backgroundColor = UIColor(white: 0.0, alpha: 1.0)
            self.isOn = false;
            self.batteryTimer.invalidate()
            self.battery = 4;
            self.batterys[0].backgroundColor = UIColor.black
        } else {
            self.batterys[self.battery].isHidden = true
            self.battery -= 1
        }
        if self.battery == 0 {
            self.batterys[0].backgroundColor = UIColor.red
        }
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
        if self.isOn {
            self.blueView.backgroundColor = UIColor(white: 0.0, alpha: 1.0)
            self.isOn = false;
            self.batterys[0].backgroundColor = UIColor.black
            self.batteryTimer.invalidate()
            
        } else {
            self.viewDidLoad()
            self.isOn = true;
        }
        AireAcondicionado.AAcontroller.onOff()
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
        if self.velocity == 3 {
            for view in 1..<4 {
                self.velocitys[view].isHidden = true
            }
            self.velocity = 0;
        } else {
            self.velocitys[self.velocity+1].isHidden = false
            self.velocity += 1
        }
        AireAcondicionado.AAcontroller.changeSpeed(speed: self.velocity+1)
    }
    @IBAction func tempUpButton(_ sender: UIButton) {
        if Int(self.tempLabel.text!)! < 29 {
            self.tempLabel.text = String(Int(self.tempLabel.text!)!+1)
            AireAcondicionado.AAcontroller.setTemuser(tem: Int(self.tempLabel.text!)!)
        }
    }
    @IBAction func tempDownButton(_ sender: UIButton) {
        if Int(self.tempLabel.text!)! > 15 {
            self.tempLabel.text = String(Int(self.tempLabel.text!)!-1)
            AireAcondicionado.AAcontroller.setTemuser(tem: Int(self.tempLabel.text!)!)
        }
    }
    @IBAction func directionButton(_ sender: UIButton) {
        
    }
    @IBAction func movingButton(_ sender: UIButton) {
    }
    @IBAction func setButton(_ sender: UIButton) {
    }
    
}

extension MandoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}
