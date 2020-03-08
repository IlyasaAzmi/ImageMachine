//
//  MachineCollectionViewCell.swift
//  ImageMachine
//
//  Created by Ilyasa Azmi on 08/03/20.
//  Copyright © 2020 Ilyasa Azmi. All rights reserved.
//

import UIKit

class MachineCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var machineLabel: UILabel!
    @IBOutlet weak var containerCell: UIView!
    
    var machine:ImageMachine! {
        didSet {
            self.update()
        }
    }
    // Aktualisiere
    func update(){
        let colors:[UIColor] = [#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), #colorLiteral(red: 0.2894071043, green: 0.9341720343, blue: 0.969543159, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.7254902124, green: 0.1283889892, blue: 0.1148036011, alpha: 1)]
        let color = Int.random(in: 0..<colors.count)
        if let machine = machine {
            containerCell.layer.cornerRadius = 20
            containerCell.backgroundColor = colors[color]
            machineLabel.text = machine.machineName
        }
        else{
            print("ERROR")
        }
    }
    
}
