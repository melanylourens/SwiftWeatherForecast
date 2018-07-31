//
//  Forecast.swift
//  WeatherForecast
//
//  Created by Melany Lourens on 2018/07/30.
//  Copyright © 2018 Melany Lourens. All rights reserved.
//

import Foundation

struct CurrentWeather: Codable {
    let name : String?
    let temp : Temp?
    let weather : [Weather]?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case temp = "main"
        case weather = "weather"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        temp = try values.decodeIfPresent(Temp.self, forKey: .temp)
        weather = try values.decodeIfPresent([Weather].self, forKey: .weather)
    }
}

struct Temp : Codable {
    let current : Double
    let min : Int
    let max : Int
    
    enum CodingKeys: String, CodingKey {
        case current = "temp"
        case min = "temp_min"
        case max = "temp_max"
    }
}
