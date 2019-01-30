//
//  Task+Convenience.swift
//  Task
//
//  Created by Dominic Lanzillotta on 1/30/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import Foundation
import CoreData


extension Task {
    convenience init(name: String, notes: String? = nil, due: Date? = nil , context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)

        self.name = name
        self.notes = notes
        self.due = due
        
    }
}
