//
//  Tab2ViewController.swift
//  MandoBootcamp
//
//  Created by user on 11/5/18.
//  Copyright © 2018 Mar Balibrea Rull. All rights reserved.
//

import UIKit

class Tab2ViewController: UIViewController {
    
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var active: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        self.currentTemp.text = String(AireAcondicionado.AAcontroller.returnAmbiente())
        
        var info:(Bool,Bool) = AireAcondicionado.AAcontroller.returnOnOffAndActivated()
        
        self.active.text = String(info.1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentTemp.text = String(AireAcondicionado.AAcontroller.returnAmbiente())
        
        var info:(Bool,Bool) = AireAcondicionado.AAcontroller.returnOnOffAndActivated()
        
        self.active.text = String(info.1)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
