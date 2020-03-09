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
    let machineThumbnail: String
    let machineType: String
    let machineQrCode: Int
    let lastMaintenanceDate = Date()
    
    // Load data(Normally from database or so)
    static func load() -> [ImageMachine] {
        let machines:[ImageMachine] = [
            ImageMachine(machineName: "Beach", machineThumbnail: "beach", machineType: "vacation", machineQrCode: 1200000),
            ImageMachine(machineName: "Beach", machineThumbnail: "beach", machineType: "work", machineQrCode: 1200000),
            ImageMachine(machineName: "Beach", machineThumbnail: "beach", machineType: "family", machineQrCode: 1200000)
        ]
        return machines
    }
}
