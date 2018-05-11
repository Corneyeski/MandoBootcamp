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
    
    //Propiedades del aire acondicionado
    
    /*
     La mayoria de propiedades son privaate por que no nos interesa que puedan modificarlas directamente
    */
    
    //Si esta encendido o apagado
    private var running:Bool = false
    //Activado o desctivado (que no apagado)
    private var active:Bool = false
    //Aire frio o caliente
    private var cool = true
    //Temperatura del usuario
    private var tuser:Int = 0
    //Temperatura de la habitacion
    private var tAmbiente:Int = Sensor.SSensor.getTemperatura()
    //TODO ventiladores
    private var estado:[String:Any] = ["hello":0]
    //Alarma para que se active automaticamente
    private var alarm = false
    //Hora inicio alarma
    private var startAlarm = 0.0
    //Hora final alarma
    private var endAlarm = 0.0
    //Potencia del aire
    private var speed = 0
    
    //Timers
    //Timer para comprobar la temperatura ambiente
    private var check:Timer!
    
    //Timer para ejecutarse mientras la tUser y la tAmbiente no sean iguales
    private var run:Timer!
 
    /*func run(run:Bool) {
        if run && !running {
            running = true
            checkAndRun()
        }else if !run && running{
            running = false
        }
    }*/
    
    //Comprueba la temperatura que se recive, si no esta dentro de los margenes, devuelve un mensaje de error si la asigna llama al metodo de comprobacion
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
    
    //TODO Cambiar la velocidad de los ventiladores
    func changeSpeed(speed:Int){
        if speed > 1 && speed < 4 {
            self.speed = speed
        }
    }
    
    //TODO asignar la alarma y crear un timer que al llegar a la hora asignada, inicie el aire acondicionado
    func alarm(start:Double, end:Double){
        
    }
    
    //Si la temperatura es diferente a la deseada, inicia el timer run, que este empieza a cambiar la temperatura ambiente hasta que se iguale con la tUser
    private func checkAndRun(){
        
        //Comprobamos la temperatura
        if tuser != tAmbiente {
            //Si la temperatura no esta igual pasa a estar activado
            active = true
            //Cada 15 seg llama al metodo que cambia la temperatura ambiente para comprobar
            run = Timer.scheduledTimer(timeInterval: 15,
                                         target: self,
                                         selector: #selector(startCheckTemperature(data: )),
                                         userInfo: "",
                                         repeats: true)
        }else{
            active = false
        }
    }
    
    //Comprueba si esta encendido o apagado y que desea el usuario, ademas comprueba la temperatura e inicia el timer de check
    func onOff(){
        if !running {
            check = Timer.scheduledTimer(timeInterval: 15,
                                 target: self,
                                 selector: #selector(startCheckTemperature(data: )),
                                 userInfo: "",
                                 repeats: true)
            running = true
            checkAndRun()
        }else{
            //Si el aire acondicionado se apaga, se para el timer de check
            running = false
            check.invalidate()
        }
    }
    
    func returnAmbiente() -> Int {
        return tAmbiente
    }
    
    func returnOnOffAndActivated() -> (running: Bool,active: Bool) {
        return (running,active)
    }
    
    @objc private func startCheckTemperature(data:Timer){
        AireAcondicionado.AAcontroller.tAmbiente = Sensor.SSensor.getTemperatura()
        checkAndRun()
        print("habitacion: \(tAmbiente) usuario: \(tuser)")
    }
    
    @objc private func startTemperature(data:Timer){
        
        if tuser != tAmbiente{
            if tAmbiente < tuser {
                tAmbiente += 1
            }else {
                tAmbiente -= 1
            }
        }else{
            active = false
            run.invalidate()
        }
        
    }
}
