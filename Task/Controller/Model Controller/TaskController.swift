//
//  TaskController.swift
//  Task
//
//  Created by Dominic Lanzillotta on 1/30/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    //MARK: - Singleton
    static let shared = TaskController()
    
    var tasks: [Task] =  {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            return try CoreDataStack.context.fetch(request)
        } catch {
            print("Error loading: \(String(describing: error)) \(error.localizedDescription))")
        }
        return []
    }()
    
    //CRUD
    func addTaskWith(name: String, notes: String?, due: Date?) {
        Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.due = due
        task.notes = notes
        saveToPersistentStore()
    }
    
    func remove(task: Task) {
        if let moc = task.managedObjectContext {
            moc.delete(task)
            saveToPersistentStore()
        }
    }
    
    //save
    func saveToPersistentStore(){
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error saving: \(String(describing: error)) \(error.localizedDescription))")
        }
    }
}
