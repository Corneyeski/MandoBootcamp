//
//  Temperatura.swift
//  MandoBootcamp
//
//  Created by user on 9/5/18.
//  Copyright © 2018 Mar Balibrea Rull. All rights reserved.
//

import Foundation

protocol Medible {
    func medible() -> Int
}

struct Temperatura: Medible, Equatable {

    var valor:Int
    var unnidad:String
    
    func medible() -> Int{
        
        return 0
    }
}
