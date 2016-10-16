//
//  LoginViewController.swift
//  Hackrice
//
//  Created by Kevin Chou on 10/15/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!
    
    var schools: [School]!
    var school: School!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logIn(_ sender: AnyObject) {
        let userNameText =  userName.text
        let userPasswordText = password.text
        
        let userNameStored = UserDefaults.standard.string(forKey: "userName")
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        
        if (userNameText?.isEmpty)! || (userPasswordText?.isEmpty)!{
            displayAlertMessage(userMessage: "You must enter a username or password")
        }
        
        
        
        if userNameText == userNameStored{
            if userPasswordText == userPasswordStored {
                let user = User(name: userNameText!, password: userPasswordText!, school: school)
                UserManager.sharedInstance.user = user
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                UserDefaults.standard.synchronize()
                performSegue(withIdentifier: "HomeScreen", sender: self)
            } else {
                displayAlertMessage(userMessage: "Username or password do not match our record")
            }
        } else {
            displayAlertMessage(userMessage: "Username or password do not match our record")
        }
        
    }
    
    func displayAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok",  style: .default, handler:nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? RegisterViewController {
            destination.schools = schools
            destination.delegate = self
        }
    }
    
}

extension LoginViewController: PickedSchoolDelegate {
    func loggedInWithOptions(_ sender: RegisterViewController, options: School) {
        school = options
    }
}
