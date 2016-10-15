//
//  UserLogin.swift
//  Hackrice
//
//  Created by Kevin Chou on 10/15/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import Foundation

class UserLogin{
    
    var guest_rating = 5.0
    var host_rating = 5.0
    var name: String
    var password: String
    var guest_reviews = [(String,Double)]()
    var host_reviews = [(String,Double)]()
    
    init(name: String, password: String)
    {
        self.name = name
        self.password = password
        
    }
    
    func addreview(description: String, temp_rating: Double, guest: Bool)
    {
        if(guest)
        {
            self.guest_reviews.append((description,temp_rating))
            self.guest_rating  = (temp_rating + guest_rating)/(Double(guest_reviews.count))
        }
        else{
            self.host_reviews.append((description,temp_rating))
            self.host_rating  = (temp_rating + host_rating)/(Double(host_reviews.count))
        }
        
    }
    
}
