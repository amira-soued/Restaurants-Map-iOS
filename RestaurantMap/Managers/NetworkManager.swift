//
//  NetworkManager.swift
//  RestaurantMap
//
//  Created by MacBook Pro on 17/12/2021.
//

import Foundation
class NetworkManager {
    public var fsqResult: [result] = []
    
    func getRestaurants(latitude: Double, longitude: Double, operation: @escaping ([result])-> Void){
      let headers = [ "Accept": "application/json",
                  "Authorization": "fsq3a1bktaaSmiWyTJ9Qacs5eK/Rz1AmQCGYf7u0MYvwSX4="]
      let request = NSMutableURLRequest(url: NSURL(string: "https://api.foursquare.com/v3/places/search?query=restaurant&ll=\(latitude)%2C\(longitude)&radius=1500&limit=50")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
      request.httpMethod = "GET"
      request.allHTTPHeaderFields = headers
      let session = URLSession.shared
      let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          
          if let error = error {
              print(error)
          }
          guard (response as? HTTPURLResponse) != nil else {
              print("Empty Response")
              return
          }
            guard let data = data else {
              print("Empty Data")
              return
          }
          do{
              let jsonData = try JSONDecoder().decode(Foursquare.self,from: data)
              DispatchQueue.main.async { [self] in
                  self.fsqResult = jsonData.results
                  let index: Int = self.fsqResult.count
                  print(index)
                  for i in 0..<index {
                      print(self.fsqResult[i].name)
                      let coordinates = fsqResult[i].geocodes.main
                      print(coordinates)
                  }
                  operation(jsonData.results)
              }
          }
          catch {
             print(error)
          }
      })
      dataTask.resume()
   }
}
