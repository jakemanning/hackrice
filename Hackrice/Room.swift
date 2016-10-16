//
//  Room.swift
//  Hackrice
//
//  Created by Hasnain Bilgrami on 10/15/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import UIKit

class Room: NSObject{
    var price:Double
    var location:String
    var image:UIImage
    var user: User
    var describe: String

    init(price:Double, location:String, image:UIImage, user: User, describe: String){
        self.price = price
        self.image = image
        self.location = location
        self.user = user
        self.describe = describe
    }
}
