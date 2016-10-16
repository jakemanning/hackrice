//
//  Room.swift
//  Hackrice
//
//  Created by Hasnain Bilgrami on 10/15/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import UIKit

struct Reviews{
    var description:String
    var rating:Int
}

class Room: NSObject{
    var price:Double//, numNights, numGuests, numBeds:Int
    var location:String
    var image:UIImage
   // var reviews:[Reviews]
    
//    numNights:Int, numGuests:Int, numBeds:Int,
    init(price:Double, location:String, image:UIImage){
        self.price = price
        self.image = image
       // self.numNights = numNights
       // self.numGuests = numGuests
       // self.numBeds = numBeds
        self.location = location
       // self.reviews = reviews
    }
}
