//
//  LoadingScreenViewController.swift
//  Hackrice
//
//  Created by Jake Manning on 10/16/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import UIKit
import CoreLocation

class LoadingScreenViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    var locationManager: CLLocationManager!
    var userCity: String?
    var colleges: [School]!
    var goingToNext = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        activityView.startAnimating()
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = 1000
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if !goingToNext {
            goingToNext = true
            if let destination = segue.destination as? LoginViewController, segue.identifier == "Login" {
                destination.schools = colleges
                destination.school = colleges[0]
            }
        }
    }
    
    // MARK: - Delegate Functions
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Locations: \(locations)")
        
        CLGeocoder().reverseGeocodeLocation(locations[0], completionHandler: { [unowned self] (placemarks, error) -> Void in
            guard error == nil else {
                print("Reverse geocoder failed with error: " + error!.localizedDescription)
                return
            }
            
            guard placemarks != nil, placemarks!.count > 0 else {
                print("Problem with the data received from geocoder")
                return
            }
            
            // Display location to console
            let pm = placemarks![0] as CLPlacemark
            guard let city = pm.locality else {
                // Coordinates aren't close to a city
                let alertController = UIAlertController(title: "Sorry", message: "You aren't in a city. Please move closer to a college", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
                
                print("You aren't in a city. Please move closer to a college")
                return
            }
            self.userCity = city
            print(city)
            
            var schoolLocator = SchoolLocations(city: city)
            schoolLocator.getCloseSchools() { (callback) in
                
                if let colleges = callback {
                    for college in colleges {
                        college.distance = college.location!.distance(from: pm.location!)
                    }
                    self.colleges = colleges.sorted(by: { Double($0.0.distance!) < Double($0.1.distance!) })
                    print(colleges)
                    
                    self.performSegue(withIdentifier: "Login", sender: self)
                }
            }
            })
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            print("Allowed location access")
        case .authorizedWhenInUse:
            print("Authorized when in use")
            locationManager.requestLocation()
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

