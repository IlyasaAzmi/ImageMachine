//
//  MachineDetailViewController.swift
//  ImageMachine
//
//  Created by Ilyasa Azmi on 08/03/20.
//  Copyright © 2020 Ilyasa Azmi. All rights reserved.
//

import UIKit
import CoreData

class MachineDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var machineDetailTableView: UITableView!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var name = ""
    
    var container: NSPersistentContainer!
    
//    var machines : [ImageMachine] = []
    var machines = [Image]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Machine Detail"
        
        machineDetailTableView.delegate = self
        machineDetailTableView.dataSource = self
        
        loadData()

        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        let request : NSFetchRequest<Image> = Image.fetchRequest()
        
        do {
            machines = try context.fetch(request)
        } catch {
            print(error)
        }
        
        machineDetailTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return machines.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "Ok"
        cell.detailTextLabel?.text = "\(machines.count) baris"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \([indexPath.row])")
    }

}
