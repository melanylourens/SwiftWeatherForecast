//
//  APIClient.swift
//  WeatherForecast
//
//  Created by Melany Lourens on 2018/07/30.
//  Copyright © 2018 Melany Lourens. All rights reserved.
//

import Foundation

enum Result<T, E: Error> {
    case value(T)
    case error(E)
}

enum APIError: Error {
    case apiError
    case badResponse
    case jsonDecoder
    case unknown(String)
}

protocol APIClient {
    var session: URLSession { get }
    func fetch<T:Codable>(with request: URLRequest, completion: @escaping (Result<T, APIError>) -> Void)
}

extension APIClient {
    func fetch<T:Codable>(with request: URLRequest, completion: @escaping (Result<T, APIError>) -> Void) {
        let apiTask = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.error(.apiError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode < 300 else {
                completion(.error(.badResponse))
                return
            }
            
            guard let value = try? JSONDecoder().decode(T.self, from: data!) else {
                completion(.error(.jsonDecoder))
                return
            }
            
            completion(.value(value))
        }
        apiTask.resume()
    }
}
