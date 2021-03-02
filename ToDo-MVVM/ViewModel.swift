//
//  ViewModel.swift
//  ToDo-MVVM
//
//  Created by Maksym on 02.03.2021.
//

import Foundation
import UIKit


class ViewModel {
    
    var id = 0
    var target: [Target] = []
    
    init() {
        target = Persistance.shared.loadedTargets()
    }
    
    func createTarget(tableView: UITableView)->UIAlertController{
        let alertController = UIAlertController(title: "New task", message: "Enter your task", preferredStyle: .alert)
            let saveTask = UIAlertAction(title: "Save", style: .default) { [self]action in
                let tf = alertController.textFields?.first
                if let newTask = tf?.text {
                    target.append(Target.setTarget(id: id, task: newTask))
                    id += 1
                    Persistance.shared.add(target: target)
                    tableView.reloadData()
                }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .default){_ in}
            alertController.addTextField{_ in}
            alertController.addAction(saveTask)
            alertController.addAction(cancelAction)
            return alertController

    }
    func removeTarget(idRemove: Int, tableView: UITableView) {
        Persistance.shared.removeTarget(idRemove: idRemove)
        target.remove(at: idRemove)
        tableView.reloadData()
    }
}
