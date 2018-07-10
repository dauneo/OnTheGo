//
//  LocationService.swift
//  AnotherGetGoing
//
//  Created by Alla Bondarenko on 2018-06-25.
//  Copyright © 2018 Alla Bondarenko. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceDelegate {
    func tracingLocation(_ currentLocation: CLLocation)
    func tracingLocationDidFailWithError(_ error: Error)
}

class LocationService: NSObject, CLLocationManagerDelegate {
    
    static let sharedInstance = LocationService()
    
    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    var delegate: LocationServiceDelegate?
    
    override init() {
        super.init()
        
        self.locationManager = CLLocationManager()
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager?.requestWhenInUseAuthorization()
        }
        
        locationManager?.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager?.delegate = self
    }
    
    func startUpdatingLocation(){
        print("started updating")
        locationManager?.startUpdatingLocation()
    }
    
    func stopUpdatingLocation(){
        print("stopped updating")
        locationManager?.stopUpdatingLocation()
    }
    
    //MARK: - CLLocation Manager Delegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        self.currentLocation = location
        delegate?.tracingLocation(location)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("failed")
        delegate?.tracingLocationDidFailWithError(error)
    }
    
    
}
