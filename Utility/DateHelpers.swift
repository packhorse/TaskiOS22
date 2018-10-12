//
//  DateHelpers.swift
//  TaskiOS22
//
//  Created by Porter Frazier on 10/10/18.
//  Copyright © 2018 BULB. All rights reserved.
//

import Foundation

extension Date {
    
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
        
    }
    
    
    
}
