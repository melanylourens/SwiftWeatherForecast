//
//  WeatherType.swift
//  WeatherForecast
//
//  Created by Melany Lourens on 2018/08/04.
//  Copyright © 2018 Melany Lourens. All rights reserved.
//

import UIKit

enum WeatherType: String {
    case cloudy = "clouds"
    case sunny = "sun"
    case clear
    case rainy = "rain"
    case other
    
    var color: UIColor {
        switch self {
        case .cloudy:
            return UIColor.cloudy()
        case .sunny:
            return UIColor.sunny()
        case .clear:
            return UIColor.sunny()
        case .rainy:
            return UIColor.rainy()
        case .other:
            return UIColor.other()
        }
    }
    
    var image: UIImage {
        switch self {
        case .cloudy:
            return UIImage(named: "sea_cloudy")!
        case .sunny:
            return UIImage(named: "sea_sunny")!
        case .clear:
            return UIImage(named: "sea_sunny")!
        case .rainy:
            return UIImage(named: "sea_rainy")!
        case .other:
            return UIImage(named: "sea_cloudy")!
        }
    }
    
    var title: String {
        switch self {
        case .cloudy:
            return "CLOUDY"
        case .sunny:
            return "SUNNY"
        case .clear:
            return "SUNNY"
        case .rainy:
            return "RAINY"
        case .other:
            return "OTHER"
        }
    }
}
