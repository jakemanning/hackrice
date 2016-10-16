//
//  DescriptionViewController.swift
//  Hackrice
//
//  Created by Kevin Chou on 10/15/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var images: UIButton!
    
    @IBOutlet weak var displayImage: UIImageView!
    
    @IBOutlet weak var priceButton: UITextField!
    
    @IBOutlet weak var schoolButton: UITextField!
    @IBAction func postRoom(_ sender: AnyObject) {
        
        let price = Double(priceButton.text!)
        let school = String(schoolButton.text!)
        
        let room = Room(price: price!,location: school!,image: currentImage)
        //let dictionary = ["Price":price,"Image":currentImage] as [String : Any]
        
        delegate.postedRoomWithOptions(self, options: room as Room)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func addImages(_ sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    var delegate: RoomsTableViewController!
    
    var currentImage: UIImage!
    
//    func importPicture() {
//        let picker = UIImagePickerController()
//        picker.allowsEditing = true
//        picker.delegate = self
//        present(picker, animated: true)
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else { return }
        
        dismiss(animated: true)
        
        currentImage = image
        
        displayImage.image = currentImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "Post room"
        
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

protocol PostedRoomDelegate: class {
    func postedRoomWithOptions(_ sender: DescriptionViewController, options: Room)
    
}
