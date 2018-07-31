//
//  Weather.swift
//  WeatherForecast
//
//  Created by Melany Lourens on 2018/07/31.
//  Copyright © 2018 Melany Lourens. All rights reserved.
//

import Foundation

struct Weather : Codable {
    let type : String
    
    enum CodingKeys: String, CodingKey {
        case type = "main"
    }
    
}
