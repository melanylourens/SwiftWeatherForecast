//
//  WeatherEndpoint.swift
//  WeatherForecast
//
//  Created by Melany Lourens on 2018/07/30.
//  Copyright © 2018 Melany Lourens. All rights reserved.
//

import Foundation

enum WeatherEndpoint: Endpoint {
    case weatherForecast(latitude: String, longitude: String)
    case fiveDayForecast()
    
    var baseUrl: String {
        return "http://api.openweathermap.org"
    }
    
    var path: String {
        switch self {
        case .weatherForecast(_, _):
            return "/data/2.5/weather"
        case .fiveDayForecast():
            return ""
        }
    }
    
    var queryItems: [URLQueryItem] {
        
        switch self {
        case .weatherForecast(let latitude, let longitude):
            let APPIDQueryItem = URLQueryItem(name: "APPID", value: "2425160e3db8a9d9203125d347bb5380")
            let unitsQueryItem = URLQueryItem(name: "units", value: "metric")
            let latQueryItem = URLQueryItem(name: "lat", value: latitude)
            let lonQueryItem = URLQueryItem(name: "lon", value: longitude)
            return [APPIDQueryItem, unitsQueryItem, latQueryItem, lonQueryItem]
        case .fiveDayForecast():
            return []
        }
    }
}
