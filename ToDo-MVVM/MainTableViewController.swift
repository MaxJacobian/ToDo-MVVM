//
//  MainTableViewController.swift
//  ToDo-MVVM
//
//  Created by Maksym on 02.03.2021.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    @IBAction func add(_ sender: Any) {
        present(model.createTarget(), animated: true)
        tableView.reloadData()
       
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return model.target.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Target", for: indexPath)
        cell.textLabel?.text = model.target[indexPath.row].task
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: false)
           model.removeTarget(idRemove:model.target[indexPath.row].id)
           model.target.remove(at: indexPath.row)
           tableView.reloadData()
       }
    
}
