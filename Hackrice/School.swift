//
//  School.swift
//  Hackrice
//
//  Created by Jake Manning on 10/15/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import Foundation
import CoreLocation

class School: NSObject {
    
    var row: [String]
    var name: String
    var address: String
    var city: String
    var state: String
    var location: CLLocation?
    
    init(row: [String]) {
        self.row = row
        
        self.name = row[1]
        self.address = row[2]
        self.city = row[3]
        self.state = row[4]
    }
    
    override var description: String {
        return "[" + name + ", " + String(describing: location!.coordinate.latitude) + "]"
    }
    
}
