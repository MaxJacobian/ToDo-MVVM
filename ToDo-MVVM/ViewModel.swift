//
//  ViewModel.swift
//  ToDo-MVVM
//
//  Created by Maksym on 02.03.2021.
//

import Foundation
import UIKit


class Model {
    
    var id = 0
    var target: [Target] = []
    
    init() {
        target = Persistance.shared.loadedTargets()
    }
    
    func createTarget()->UIAlertController{
        let alertController = UIAlertController(title: "New task", message: "Enter your task", preferredStyle: .alert)
            let saveTask = UIAlertAction(title: "Save", style: .default) { [self]action in
                let tf = alertController.textFields?.first
                if let newTask = tf?.text {
                    target.append(Target.setTarget(id: id, task: newTask))
                    id += 1
                    Persistance.shared.add(target: target)
                }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .default){_ in}
            alertController.addTextField{_ in}
            alertController.addAction(saveTask)
            alertController.addAction(cancelAction)
            return alertController

    }
    func removeTarget(idRemove: Int) {
        Persistance.shared.removeTarget(idRemove: idRemove)
    }
}
