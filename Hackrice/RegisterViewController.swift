//
//  RegisterViewController.swift
//  Hackrice
//
//  Created by Hasnain Bilgrami on 10/15/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func registerAction(_ sender: AnyObject) {
        let userNameText =  userName.text
        let passwordText = password.text
        let confirmPasswordText = confirmPassword.text
        if((userNameText?.isEmpty)! || (passwordText?.isEmpty)! || (confirmPasswordText?.isEmpty)! ){
            displayAlertMessage(userMessage: "All Fields are required")
            return
        }
        if (passwordText != confirmPasswordText){
            displayAlertMessage(userMessage: "Passwords do not match")
           return
        }
        
        UserDefaults.standard.set(userNameText, forKey: "userName")
        UserDefaults.standard.set(passwordText, forKey: "userPassword")
        UserDefaults.standard.synchronize()
        
        let myAlert = UIAlertController(title: "Alert", message:
            "Registration is succesful. Thank You!", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok",  style: .default){
            action in self.dismiss(animated: true, completion: nil)
        }
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)


    }

    func displayAlertMessage(userMessage:String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok",  style: .default, handler:nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
        
        
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
