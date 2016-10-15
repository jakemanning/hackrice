//
//  Room.swift
//  Hackrice
//
//  Created by Hasnain Bilgrami on 10/15/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import Foundation

struct Reviews{
    var description:String
    var rating:Int
}

class Room{
    var price, numNights, numGuests, numBeds:Int
    var location:String
    var reviews:[Reviews]
    
    init(price:Int, numNights:Int, numGuests:Int, numBeds:Int, location:String, reviews:[Reviews]){
        self.price = numNights
        self.numNights = numNights
        self.numGuests = numGuests
        self.numBeds = numBeds
        self.location = location
        self.reviews = reviews
    }
}
