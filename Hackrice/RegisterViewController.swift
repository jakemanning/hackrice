//
//  RegisterViewController.swift
//  Hackrice
//
//  Created by Hasnain Bilgrami on 10/15/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var schoolPicker: UIPickerView!
    
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
        

        delegate.loggedInWithOptions(self, options: school)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginInstead(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    var school: School!
    var schools: [School]!
    var delegate: LoginViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //        schoolPicker.
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
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return schools.count
    }
    
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return schools[row].name + " " + String(schools[row].distance!)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        school = schools[row]
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

protocol PickedSchoolDelegate: class {
    func loggedInWithOptions(_ sender: RegisterViewController, options: School)
    
}
