//
//  TextParser.swift
//  Hackrice
//
//  Created by Jake Manning on 10/15/16.
//  Copyright © 2016 Rice Competition. All rights reserved.
//

import Foundation
import CoreLocation

struct SchoolLocations {
    private var userCity: String
    private var csv: CSwiftV?
    private var similarSchools: [School]?
    private var schools: [School]?
    
    init(city: String) {
        self.userCity = city
    }
    
    mutating func getCloseSchools(callback: @escaping ([School]?) -> ()) {
        guard schools == nil else {
            return
        }
        
        getSimilarSchools()
        guard let schools = similarSchools else {
            print("Error reading schools")
            return
        }
        let myGroup = DispatchGroup()
        for school in schools {
            myGroup.enter()
            findLocation(school: school) { (result) in
                myGroup.leave()
                if(result != nil) {
                    school.location = result!
                }
            }

        }
        
        myGroup.notify(queue: DispatchQueue.main, execute: {
            print("All Done")
            callback(schools)
        })
    }
    
    mutating private func getSimilarSchools() {
        if let schools = readFiles() {
            self.similarSchools = [School]()
            for row in schools.rows {
                let school = School(row: row)
                if(school.city == userCity) {
                    similarSchools!.append(school)
                }
            }
        }
    }
    
    func findLocation(school: School, result : @escaping (CLLocation?) -> ()) {
        let geocoder = CLGeocoder()
        let addressToSearch = school.address + " " + school.city + ", " + school.state
        geocoder.geocodeAddressString(addressToSearch, completionHandler: {(placemarks, error) -> Void in
            guard error == nil else {
                print("Geocoder failed with error: " + error!.localizedDescription)
                return
            }
            
            guard placemarks != nil, placemarks!.count > 0 else {
                print("Problem with the data received from geocoder")
                return
            }
            
            if let placemark = placemarks?[0] {
                print("Geocoded location: \(placemark.location!)")
                school.location = placemark.location
                result(placemark.location)
            }
        })
    }
    
    private mutating func readFiles() -> CSwiftV? {
        print("Parsing...")
        if let filePath = Bundle.main.path(forResource: "Schools", ofType: "csv") {
            if let fileContents = try? String(contentsOfFile: filePath) {
                let csv = CSwiftV(with: fileContents)
                self.csv = csv
                return csv
            }
        } else {
            print("The read didn't work")
        }
        
        return nil
    }
}
