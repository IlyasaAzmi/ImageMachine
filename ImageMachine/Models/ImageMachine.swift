//
//  ImageMachine.swift
//  ImageMachine
//
//  Created by Ilyasa Azmi on 08/03/20.
//  Copyright © 2020 Ilyasa Azmi. All rights reserved.
//

import Foundation

struct ImageMachine {
//    let machineId: String
    let machineName: String
//    let machineType: String
//    let machineQrCode: Int
//    let lastMaintenanceDate: Date
    
    // Load data(Normally from database or so)
    static func load() -> [ImageMachine] {
        var machines:[ImageMachine] = []
        let names:[String] = ["Design", "Research", "Beauty", "Travel", "Makeup"]
        for name in names{
            machines.append(ImageMachine(machineName: name))
        }
//        categories.shuffle()
        return machines
    }
}
