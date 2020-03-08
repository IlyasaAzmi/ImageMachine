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
    @IBOutlet weak var machineThumbnailImageView: UIImageView!
    
    var machine:ImageMachine! {
        didSet {
            self.update()
        }
    }
    
    // Update User Interface
    func update(){
        if let machine = machine {
            self.machineThumbnailImageView.layer.cornerRadius = 20
            self.machineThumbnailImageView.layer.masksToBounds = true
            self.machineLabel.text = machine.machineName
            self.machineThumbnailImageView.image = UIImage(named: machine.machineThumbnail)
        }
        else{
            print("ERROR")
        }
        
    }
    
}
