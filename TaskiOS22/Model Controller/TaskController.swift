//
//  TaskController.swift
//  TaskiOS22
//
//  Created by Porter Frazier on 10/10/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    //Shared Instance or Singelton:
    static let shared = TaskController()
    
    //BOX or SOT
    var tasks: [Task] = []
    
    init() {
        tasks = fetchTasks()
    }
    
    
    //Mark -: //CRUD
    
    //addTask
    func add(taskWithName name: String, notes: String?, due: Date?) {
        _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
        tasks = fetchTasks()
    }
    
    //remove
    func delete(task: Task) {
        let moc = CoreDataStack.context
        moc.delete(task)
        saveToPersistentStore()
        tasks = fetchTasks()
    }
    
    //updateTask
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due as Date?
        saveToPersistentStore()
        tasks = fetchTasks()
    }
    
    func toggleIsCompleteForTask(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    
    //saveToPersistenceStore()
    func saveToPersistentStore() {
        
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error with saving the object")
        }
    }
    
    
    private func fetchTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
    }
    
    

    
}
