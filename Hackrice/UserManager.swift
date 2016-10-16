//
//  UserManager.swift
//  Hackrice
//
//  Created by Jake Manning on 10/16/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import Foundation

class UserManager: NSObject {
    static let sharedInstance = UserManager()
    var rooms = [Room]()
    var user: User!
 
}
