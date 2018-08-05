//
//  WeatherAPIClient.swift
//  WeatherForecast
//
//  Created by Melany Lourens on 2018/07/30.
//  Copyright © 2018 Melany Lourens. All rights reserved.
//

import Foundation

class WeatherAPIClient: APIClient {
    var session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchWeather(latitude: String, longitude: String, completion: @escaping (Result<CurrentWeather, APIError>) -> Void) {
        let request = WeatherEndpoint.weatherForecast(latitude: latitude, longitude: longitude).request
        self.fetch(with: request) { (result: Result<CurrentWeather, APIError>) in
            switch result {
                case .value(let weather):
                    completion(.value(weather))
                case .error(let error):
                    completion(.error(error))
                break
            }
        }
        
    }
    
    func fetchForecast(latitude: String, longitude: String, completion: @escaping (Result<Forecast, APIError>) -> Void) {
        let request = WeatherEndpoint.dailyForecast(latitude: latitude, longitude: longitude).request
        self.fetch(with: request) { (result: Result<Forecast, APIError>) in
            switch result {
            case .value(let forecast):
                completion(.value(forecast))
            case .error(let error):
                completion(.error(error))
                break
            }
        }
        
    }
}
