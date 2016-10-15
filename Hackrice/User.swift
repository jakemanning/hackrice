//
//  UserLogin.swift
//  Hackrice
//
//  Created by Kevin Chou on 10/15/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import Foundation

class User {
    
    var guestRating = 5.0
    var hostRating = 5.0
    var name: String
    var password: String
    var guestReviews = [(String,Double)]()
    var hostReviews = [(String,Double)]()
    
    init(name: String, password: String)
    {
        self.name = name
        self.password = password
        
    }
    
    func addReview(description: String, tempRating: Double, guest: Bool)
    {
        if(guest)
        {
            self.guestReviews.append((description,tempRating))
            self.guestRating  = (tempRating + guestRating) / (Double(guestReviews.count + 1))
        }
        else{
            self.hostReviews.append((description, tempRating))
            self.hostRating  = (tempRating + hostRating) / (Double(hostReviews.count + 1))
        }
        
    }
    
}
