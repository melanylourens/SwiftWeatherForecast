//
//  Forecast.swift
//  WeatherForecast
//
//  Created by Melany Lourens on 2018/07/31.
//  Copyright © 2018 Melany Lourens. All rights reserved.
//

import Foundation

struct ForecastList: Codable {
    let forecastList : [Forecast]
    
    enum CodingKeys: String, CodingKey {
        case forecastList = "list"
    }    
}

struct Forecast: Codable {
    let date : String
    let temp : ForecastTemp
    let weather : [Weather]
    
    enum CodingKeys: String, CodingKey {
        case date = "dt_txt"
        case temp = "main"
        case weather = "weather"
    }
}

struct ForecastTemp: Codable {
    let current : Double
    let min : Double
    let max : Double
    
    enum CodingKeys: String, CodingKey {
        case current = "temp"
        case min = "temp_min"
        case max = "temp_max"
    }
}

