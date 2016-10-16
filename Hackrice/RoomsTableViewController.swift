//
//  RoomsTableViewController.swift
//  Hackrice
//
//  Created by Hasnain Bilgrami on 10/15/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import UIKit

class RoomsTableViewController: UITableViewController {

    var rooms = [Room]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserManager.sharedInstance.rooms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomIdentifier", for: indexPath) as! RoomTableViewCell
        let row = indexPath.row
        // Configure the cell...
        cell.room = UserManager.sharedInstance.rooms[row]

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? DescriptionViewController {
            destination.delegate = self
            
        } else if let destination = segue.destination as? RoomViewController {
            
            if let send = sender as? RoomTableViewCell {
                let room = send.room
                destination.priceForPrice = String(room!.price)
                destination.imageForImage = room!.image
                destination.name = UserManager.sharedInstance.user.name
                destination.describeForDescribe = String(room!.describe)
            }
        }
    }
    

}

extension RoomsTableViewController: PostedRoomDelegate {
    func postedRoomWithOptions(_ sender: DescriptionViewController, options: Room){
        UserManager.sharedInstance.rooms.append(options)
        tableView.reloadData()
    }
}
