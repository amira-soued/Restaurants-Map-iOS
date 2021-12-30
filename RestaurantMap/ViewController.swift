//
//  ViewController.swift
//  RestaurantMap
//
//  Created by MacBook Pro on 14/12/2021.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate{
    let locationManager : CLLocationManager = CLLocationManager()
  
    let networkManager = NetworkManager()
    var currentLocation: CLLocation?

    @IBOutlet weak var allowAcessButton: UIButton!
    @IBOutlet weak var showMapButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        showMapButton.isEnabled = false
        locationManager.delegate = self
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = locationManager.authorizationStatus
        switch status {
        case .denied:
            print("denied")
        case .notDetermined:
            print("notDetermined")
        default:
            enableMapButton()
        }
    }

    @IBAction func accessButton(_ sender: UIButton) {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func enableMapButton(){
        switch locationManager.authorizationStatus{
        case .authorizedWhenInUse:
            showMapButton.isEnabled = true
        case .authorizedAlways:
            showMapButton.isEnabled = true
        default:
            showMapButton.isEnabled = false
        }
      }
    
    @IBAction func showMapButtonEnabled(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Map", bundle: nil)
            let vc = (storyboard.instantiateViewController(identifier: "MapViewController") as? MapViewController)!
            self.navigationController?.pushViewController(vc, animated: true)
    }
}

