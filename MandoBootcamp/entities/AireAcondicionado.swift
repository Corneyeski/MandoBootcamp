//
//  AireAcondicionado.swift
//  MandoBootcamp
//
//  Created by user on 9/5/18.
//  Copyright © 2018 Mar Balibrea Rull. All rights reserved.
//

import Foundation

class AireAcondicionado {
    
    static let AAcontroller:AireAcondicionado = AireAcondicionado()
    
    var running:Bool = false
    private var active:Bool = false
    private var tuser:Int = 0
    private var tAmbiente:Int = Sensor.SSensor.getTemperatura()
    private var estado:[String:Any] = ["hello":0]
    private var alarm = false
    private var startAlarm = 0.0
    private var endAlarm = 0.0
    private var speed = 0
    
    func run(run:Bool) {
        if run && !running {
            running = true
        }else if !run && running{
            running = false
        }
    }
    
    func setTemuser(tem:Int) -> String? {
        
        if tem < 15 {
            return "Temperatura al minimo"
        }else if tem > 29{
            return "Temperatura al maximo"
        }
        
        tuser = tem
        checkAndRun()
        
        return nil
    }
    
    func changeSpeed(speed:Int){
        if speed > 1 && speed < 4 {
            self.speed = speed
        }
    }
    
    func alarm(start:Double, end:Double){
        
    }
    
    private func checkAndRun(){
        if tuser != tAmbiente {
            
        }else{
            active = false
        }
    }
}
