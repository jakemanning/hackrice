//
//  RoomTableViewCell.swift
//  Hackrice
//
//  Created by Jake Manning on 10/16/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import UIKit

class RoomTableViewCell: UITableViewCell {

    @IBOutlet weak var roomImageView: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var school: UILabel!
    
    var room: Room! {
        didSet {
            roomImageView.image = room.image
            userName.text = UserManager.sharedInstance.user.name
            price.text = "$" + String(room.price) + "/Day"
            school.text = room.user.school.name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
