//
//  LocationManager.swift
//  RestaurantMap
//
//  Created by MacBook Pro on 17/12/2021.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
//        if locationIsAuthorized() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.allowsBackgroundLocationUpdates = true
            locationManager.startUpdatingLocation()
//        }
    }
    
    func locationIsAuthorized() -> Bool {
        locationManager.authorizationStatus == .authorizedWhenInUse || locationManager.authorizationStatus == .authorizedAlways
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.first
    }
}
