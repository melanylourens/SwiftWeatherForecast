//
//  WeatherTypeColor.swift
//  WeatherForecast
//
//  Created by Melany Lourens on 2018/07/30.
//  Copyright © 2018 Melany Lourens. All rights reserved.
//

import Foundation
import UIKit

extension UIColor
{
    class func cloudy() -> UIColor
    {
        return UIColor(red: 97/255.0, green: 133/255.0, blue: 149/255.0, alpha: 1.0)
    }
    
    class func sunny() -> UIColor
    {
        return UIColor(red: 73/255.0, green: 144/255.0, blue: 226/255.0, alpha: 1.0)
    }
    
    class func rainy() -> UIColor
    {
        return UIColor(red: 88/255.0, green: 87/255.0, blue: 93/255.0, alpha: 1.0)
    }
    
    class func other() -> UIColor
    {
        return UIColor(red: 165/255.0, green: 165/255.0, blue: 165/255.0, alpha: 1.0)
    }
}
