//
//  WeatherTypeImage.swift
//  WeatherForecast
//
//  Created by Melany Lourens on 2018/08/04.
//  Copyright © 2018 Melany Lourens. All rights reserved.
//

import UIKit

enum WeatherType: String {
    case cloudy
    case sunny
    case rainy
    case other
    
    var color: UIColor {
        switch self {
        case .cloudy:
            return UIColor.cloudy()
        case .sunny:
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
        case .rainy:
            return UIImage(named: "sea_rainy")!
        case .other:
            return UIImage(named: "sea_cloudy")!
        }
    }
}
