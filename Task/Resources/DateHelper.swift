//
//  DateHelper.swift
//  Task
//
//  Created by Dominic Lanzillotta on 1/30/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

import Foundation


extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
