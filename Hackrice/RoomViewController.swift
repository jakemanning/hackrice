//
//  RoomViewController.swift
//  Hackrice
//
//  Created by Jake Manning on 10/16/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import UIKit

class RoomViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var describe: UITextView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var imageForImage: UIImage!
    var describeForDescribe: String!
    var name: String!
    var priceForPrice: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Room"
        rating.text = String(5.0)
        image.image = imageForImage
        describe.text = describeForDescribe
        username.text = name
        price.text = priceForPrice
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
