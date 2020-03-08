//
//  ViewController.swift
//  ImageMachine
//
//  Created by Ilyasa Azmi on 07/03/20.
//  Copyright © 2020 Ilyasa Azmi. All rights reserved.
//

import UIKit

class MachineViewController: UIViewController {

    @IBOutlet weak var machineCollectionView: UICollectionView!
    
    let machines = ImageMachine.load()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Machine"
        
        machineCollectionView.dataSource = self
        
        let itemSize = UIScreen.main.bounds.width/2 - 3

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)

        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        // Do any additional setup after loading the view.
    }
}

extension MachineViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return machines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MachineCollectionViewCell", for: indexPath) as! MachineCollectionViewCell
        
        let machine = machines[indexPath.row]
        cell.machineLabel.text = machine.machineName
        return cell
    }
}

