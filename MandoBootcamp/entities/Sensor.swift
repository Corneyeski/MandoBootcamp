//
//  Sensor.swift
//  MandoBootcamp
//
//  Created by user on 9/5/18.
//  Copyright © 2018 Mar Balibrea Rull. All rights reserved.
//

import Foundation

class Sensor {
    static let SSensor:Sensor = Sensor()
    
    func getTemperatura() -> Int {
        return Int(arc4random_uniform(46)+0)
    }
}
