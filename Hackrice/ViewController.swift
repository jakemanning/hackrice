//
//  ViewController.swift
//  Hackrice
//
//  Created by Jake Manning on 10/13/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBAction func action(_ sender: AnyObject) {
        print("Received tap")
    }
    @IBOutlet weak var button: UIButton!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Loaded application")
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Delegate Functions
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Locations: \(locations)")
        button.setTitle("Received Location", for: .normal)
        print(button.titleLabel!.text!)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            print("Allowed location access")
        case .authorizedWhenInUse:
            print("Authorized when in use")
        case .denied:
            print("Denied")
        case .notDetermined:
            print("Not determined")
        case .restricted:
            print("Restricted")
        }

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        manager.stopUpdatingLocation()
        print("Error: \(error)")
        
    }
}

