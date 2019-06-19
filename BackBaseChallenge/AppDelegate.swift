//
//  AppDelegate.swift
//  BackBaseChallenge
//
//  Created by Nicholas Sharp on 6/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let city = TestData.getSingleResponse()
    let cities = TestData.getAllCities()
    let filteredCities = TestData.filterForString(cities: cities, searchString: "UA")
    let toyCities = TestData.filterForString(cities: cities, searchString: "toy")
    let bismCities = TestData.filterForString(cities: cities, searchString: "bism")
    return true
  }
}

class TestData {
  
  static func getSingleResponse() -> Cities {
    let fileURL = Bundle.main.url(forResource: "SingleResponse", withExtension: "json")!
    let data = try! Data.init(contentsOf: fileURL)
    return try! JSONDecoder().decode(Cities.self, from: data)
  }
  static func getAllCities() -> [Cities] {
    let fileURL = Bundle.main.url(forResource: "cities", withExtension: "json")!
    let data = try! Data(contentsOf: fileURL)
    var cities = [Cities]()
    //        DispatchQueue.global().async {
    cities = try! JSONDecoder().decode([Cities].self, from: data)
    //        }
    return cities
  }
  
  static func filterForString(cities: [Cities], searchString: String) -> [Cities] {
    let startTime = CFAbsoluteTimeGetCurrent()
    let results = cities.filter { (city) -> Bool in
      if city.city.lowercased().starts(with: searchString.lowercased()) {
        return true
      } else {
        return false
      }
    }
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("Time elapsed for filtering: \(timeElapsed) s.")
    return results
  }
  
      func printTimeElapsedWhenRunningCode(title:String, operation:()->()) {
          let startTime = CFAbsoluteTimeGetCurrent()
          operation()
          let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
          print("Time elapsed for \(title): \(timeElapsed) s.")
      }
}
