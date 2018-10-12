//
//  Task+Convenience.swift
//  TaskiOS22
//
//  Created by Porter Frazier on 10/10/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    convenience init(name: String, notes: String?, due: Date? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        
        self.name = name
        self.notes = notes
        self.due = due as Date?
        self.isComplete = false
        
    }
}
