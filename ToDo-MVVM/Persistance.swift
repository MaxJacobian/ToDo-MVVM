//
//  Persistance.swift
//  ToDo-MVVM
//
//  Created by Maksym on 02.03.2021.
//

import Foundation
import RealmSwift

class Target: Object{
    @objc dynamic var id = Int()
    @objc dynamic var task = String()
    
    static func setTarget(id: Int, task: String)->Target {
        let target = Target()
        target.id = id
        target.task = task
        return target
    }
}

class Persistance {
    
    var storage: [Target] = []
    
    static let shared = Persistance()
    let relam = try! Realm()

    func add(target: [Target]){
        for element in target {
            try! relam.write(){
                relam.add(element)
            }
        }
    }
    
    func loadedTargets()->[Target]{
        for target in relam.objects(Target.self){
            if !target.task.isEmpty{
                storage.append(target)
                
            }
        }
        return storage
    }
    func removeTarget(idRemove: Int){
        let targets = relam.objects(Target.self)
        for target in targets {
            if target.id == idRemove {
                try! relam.write(){
                    relam.delete(target)
                }
            }
        }
    }
}
