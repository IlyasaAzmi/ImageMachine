//
//  ViewController.swift
//  ImageMachine
//
//  Created by Ilyasa Azmi on 07/03/20.
//  Copyright © 2020 Ilyasa Azmi. All rights reserved.
//

import UIKit
import CoreData

class MachineViewController: UIViewController {

    @IBOutlet weak var machineCollectionView: UICollectionView!
    
    var container: NSPersistentContainer!
    
//    var machines = ImageMachine.load()
    var machines = [Image]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Machine"
        
        machineCollectionView.dataSource = self
        machineCollectionView.delegate = self
        
        let itemSize = UIScreen.main.bounds.width/2 - 3

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)

        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3

        machineCollectionView.collectionViewLayout = layout
        
        loadData()
        
//        guard container != nil else {
//            fatalError("This view needs a persistent container.")
//        }
//        // The persistent container is available.
    }
    
    @IBAction func addBarButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        var thumbnailTextField = UITextField()
        var qrTextField = UITextField()
        var typeTextField = UITextField()
        let alert = UIAlertController(title: "Create New Machine", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newItem = Image(context: self.context)
            newItem.name = textField.text
            newItem.thumbnail = thumbnailTextField.text
            newItem.qrcode = qrTextField.text
            newItem.type = typeTextField.text
            newItem.lastMaintenanceDate = Date()
            
            self.machines.append(newItem)
            self.saveData()
        }
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("cancel tapped")
        }
        
        alert.addAction(action)
        alert.addAction(cancelAction)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "New Item Here"
            textField = alertTextField
        }
        alert.addTextField { (alertThumbnailTextField) in
            alertThumbnailTextField.placeholder = "enter yout image name"
            thumbnailTextField = alertThumbnailTextField
        }
        alert.addTextField { (alertQrTextField) in
            alertQrTextField.placeholder = "enter yout qr code here"
            qrTextField = alertQrTextField
        }
        alert.addTextField { (alertTypeTextField) in
            alertTypeTextField.placeholder = "enter yout type here"
            typeTextField = alertTypeTextField
        }
        present(alert, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let machineDetailVC = segue.destination as? MachineDetailViewController {
            machineDetailVC.container = container
        }
    }
    
    func saveData() {
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("Error saving data \(error)")
        }
        machineCollectionView.reloadData()
    }
    
    func loadData() {
        let request : NSFetchRequest<Image> = Image.fetchRequest()
        
        do {
            machines = try context.fetch(request)
        } catch {
            print(error)
        }
        
        machineCollectionView.reloadData()
    }
}

extension MachineViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return machines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MachineCollectionViewCell", for: indexPath) as! MachineCollectionViewCell
        
        let machine = machines[indexPath.row]
        cell.machineLabel.text = machine.name
        cell.machineThumbnailImageView.image = UIImage(named: "\(machine.thumbnail ?? "beach")")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("clicked cell \([indexPath.row])")
        let vc = storyboard?.instantiateViewController(withIdentifier: "MachineDetailViewController") as! MachineDetailViewController
        vc.name = machines[indexPath.row].name!
        print(vc.name)
        self.navigationController?.pushViewController(vc, animated: true)
        
        
//        print("cell clicked")
//        //MARK: Update Data
//        var textField = UITextField()
//        var thumbnailTextField = UITextField()
//        var qrTextField = UITextField()
//        var typeTextField = UITextField()
//
//        let alert = UIAlertController(title: "Change Machine", message: "", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Update Item", style: .default) { (action) in
//
//            self.machines[indexPath.row].setValue(textField.text, forKey: "name")
//            self.machines[indexPath.row].setValue(thumbnailTextField.text, forKey: "thumbnail")
//            self.machines[indexPath.row].setValue(qrTextField.text, forKey: "qrcode")
//            self.machines[indexPath.row].setValue(typeTextField.text, forKey: "type")
//            self.machines[indexPath.row].setValue(Date(), forKey: "lastMaintenanceDate")
//
//            self.saveData()
//        }
//        alert.addAction(action)
//        alert.addTextField { (alertTextField) in
//            alertTextField.placeholder = "New Item Here"
//            textField = alertTextField
//        }
//        alert.addTextField { (alertThumbnailTextField) in
//            alertThumbnailTextField.placeholder = "enter yout image name"
//            thumbnailTextField = alertThumbnailTextField
//        }
//        alert.addTextField { (alertQrTextField) in
//            alertQrTextField.placeholder = "enter yout qr code here"
//            qrTextField = alertQrTextField
//        }
//        alert.addTextField { (alertTypeTextField) in
//            alertTypeTextField.placeholder = "enter yout type here"
//            typeTextField = alertTypeTextField
//        }
//        present(alert, animated: true, completion: nil)
    }
}

