//
//  NavigationManager.swift
//  RestaurantMap
//
//  Created by MacBook Pro on 17/12/2021.
//

import Foundation
import UIKit

class NavigationManager {
    let window: UIWindow?
    let locationManager = LocationManager()

    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        if locationManager.locationIsAuthorized() {
            showMap()
        } else {
            showAuthorizaionScreen()
        }
    }
    
    func showMap() {
        let storyboard = UIStoryboard(name: "Map", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "MapViewController") as! MapViewController
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav
    }
    func showAuthorizaionScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "MainViewController") as! ViewController
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav
    }
}
