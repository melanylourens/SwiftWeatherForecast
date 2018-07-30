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
    
    func weather(with endpoint: WeatherEndpoint, completion: @escaping (Result<CurrentWeather, APIError>) -> Void) {
        let request = endpoint.request
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
}
