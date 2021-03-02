//
//  MainTableViewController.swift
//  ToDo-MVVM
//
//  Created by Maksym on 02.03.2021.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func add(_ sender: Any) {
        present(viewModel.createTarget(tableView: self.tableView), animated: true)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.target.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Target", for: indexPath)
        cell.textLabel?.text = viewModel.target[indexPath.row].task
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: false)
        viewModel.removeTarget(idRemove: viewModel.target[indexPath.row].id, tableView: tableView)
       }
}
