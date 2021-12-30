//
//  MapViewController.swift
//  RestaurantMap
//
//  Created by MacBook Pro on 14/12/2021.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController{
    
    @IBOutlet weak var mapView: MKMapView!

    let locationManager = LocationManager()
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let currentLocation = locationManager.currentLocation
        if locationManager.locationIsAuthorized(),
           let latitude = currentLocation?.coordinate.latitude,
           let longitude = currentLocation?.coordinate.longitude {
            networkManager.getRestaurants(latitude: latitude, longitude: longitude, operation: displayRestaurantsOnMap)
            mapView.showsUserLocation = true
            zoomOnMap()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
     func displayRestaurantsOnMap(restaurantResult: [result]){
        
        let index = restaurantResult.count
        print(index)
        for restaurant in restaurantResult{
            let annotation = MKPointAnnotation()
            annotation.title = restaurant.name
            let location = CLLocationCoordinate2D(latitude: restaurant.geocodes.main.latitude, longitude: restaurant.geocodes.main.longitude)
            annotation.coordinate = location
            mapView.addAnnotation(annotation)
        }
     }
    
     func zoomOnMap(){
        let location = locationManager.currentLocation
        if let latitude = location?.coordinate.latitude,
            let longitude = location?.coordinate.longitude {
        let center = CLLocationCoordinate2D(latitude: latitude , longitude: longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        //region.center = mapView.userLocation.coordinate
        mapView.setRegion(region, animated: true)
        }
     }
}

