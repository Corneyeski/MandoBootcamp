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
    
    var running:Bool = true
    private var active:Bool = false
    private var cool = true
    private var tuser:Int = 0
    private var tAmbiente:Int = Sensor.SSensor.getTemperatura()
    private var estado:[String:Any] = ["hello":0]
    private var alarm = false
    private var startAlarm = 0.0
    private var endAlarm = 0.0
    private var speed = 0
    
    //Timers
    private var check:Timer!
    
    private var run:Timer!
    
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
            active = true
            run = Timer.scheduledTimer(timeInterval: 15,
                                         target: self,
                                         selector: #selector(startCheckTemperature(data: )),
                                         userInfo: "",
                                         repeats: true)
        }else{
            active = false
        }
    }
    
    func onOff(){
        if !running {
            check = Timer.scheduledTimer(timeInterval: 15,
                                 target: self,
                                 selector: #selector(startCheckTemperature(data: )),
                                 userInfo: "",
                                 repeats: true)
            running = true
        }else{
            running = false
            check.invalidate()
        }
        checkAndRun()
    }
    
    @objc private func startCheckTemperature(data:Timer){
        AireAcondicionado.AAcontroller.tAmbiente = Sensor.SSensor.getTemperatura()
        
        print("habitacion: \(tAmbiente) usuario: \(tuser)")
    }
}
