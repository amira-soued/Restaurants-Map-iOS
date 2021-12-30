//
//  APIResponse.swift
//  RestaurantMap
//
//  Created by MacBook Pro on 20/12/2021.
//

import Foundation

struct Foursquare:Codable {
    let results: [result]
}
 
struct result:Codable {
    let fsq_id: String
    let categories: [category]
    let distance: Float
    let geocodes: geocode
    let name: String
    let location: locationType
}
struct geocode: Codable {
    let main: coordinate
}
struct coordinate: Codable {
    let latitude, longitude: Double
}

struct category: Codable {
    let id: Int
    let name: String
    let icon: iconType
}

struct iconType: Codable {
    let prefix:String
    let suffix:String
}

struct locationType: Codable {
    let address:String?
    let admin_region:String?
    let country:String
}
