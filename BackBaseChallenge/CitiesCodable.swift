//
//  CitiesCodable.swift
//  BackBaseChallenge
//
//  Created by Nicholas Sharp on 6/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct Cities: Codable {
  let country: String
  let city: String
  let id: Int
  let coordinates: Coordinates
  
  enum CodingKeys: String, CodingKey {
    case country
    case city = "name"
    case id = "_id"
    case coordinates = "coord"
  }
}

struct Coordinates: Codable {
  let longitude: Float
  let latitude: Float
  
  enum CodingKeys: String, CodingKey {
    case longitude = "lon"
    case latitude = "lat"
  }
}
