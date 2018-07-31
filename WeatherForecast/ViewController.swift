//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Melany Lourens on 2018/07/28.
//  Copyright © 2018 Melany Lourens. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var loadingIndicatior: UIActivityIndicatorView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var currentCity: UILabel!
    @IBOutlet weak var bigCurrentTemp: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var smallCurrentTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UILabel.appearance().textColor = UIColor.white
        loadingIndicatior.startAnimating()
        
        isAuthorizedtoGetUserLocation()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        } else {
            print("Location services not enabled")
        }
    }
    
    func isAuthorizedtoGetUserLocation() {
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse     {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied {
            showLocationDisabledAlert()
        } else if status == .authorizedWhenInUse {
            print("User allowed us to access location")
            if CLLocationManager.locationServicesEnabled() {
                locationManager.startUpdatingLocation()
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location: CLLocationCoordinate2D = locations.first?.coordinate { //manager.location!.coordinate
            print("locations", location.latitude, location.longitude, locations.first!)
            fetchWeather(latitude: location.latitude, longitude: location.longitude)
            fetchForecast(latitude: location.latitude, longitude: location.longitude)
            locationManager.stopUpdatingLocation()
        }
    }

    func fetchWeather(latitude: Double, longitude: Double) {
        WeatherAPIClient().fetchWeather(latitude: String(latitude), longitude: String(longitude), completion: { (result) in
            switch result {
            case .value(let weather):
                print("weather", weather)
                self.updateUIFields(weather: weather)
            case .error(let error):
                print("error", error)
            }
        })
    }

    func updateUIFields(weather: CurrentWeather) {
        DispatchQueue.main.async {
            if let currentCity = weather.city {
                self.currentCity.text = String(currentCity)
            }
            
            if let currentTempText = weather.temp?.current {
                self.bigCurrentTemp.text = String(format: "%.0f\u{00B0}", currentTempText.rounded())
                self.smallCurrentTemp.text = String(format: "%.0f\u{00B0}", currentTempText.rounded())
            }
            
            if let weatherTypeText = weather.weather?.first?.type {
                self.weatherType.text = String(weatherTypeText).uppercased()
                self.bottomContainer.backgroundColor = UIColor.blue
            }
            
            if let minTempText = weather.temp?.min {
                self.minTemp.text = String(format: "\(minTempText)\u{00B0}")
            }
            
            if let maxTempText = weather.temp?.max {
                self.maxTemp.text = String(format: "\(maxTempText)\u{00B0}")
            }
            
            self.loadingIndicatior.stopAnimating()
        }
    }
    
    func fetchForecast(latitude: Double, longitude: Double) {
        WeatherAPIClient().fetchForecast(latitude: String(latitude), longitude: String(longitude), completion: { (result) in
            switch result {
            case .value(let forecast):
                print("forecast", forecast)
                self.updateUIFields(forecast: forecast)
            case .error(let error):
                print("error", error)
            }
        })
    }
    
    func updateUIFields(forecast: Forecast) {
        DispatchQueue.main.async {
            self.loadingIndicatior.stopAnimating()
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Did location updates is called but failed to get location \(error)")
    }

    func showLocationDisabledAlert() {
        let alertController = UIAlertController(title: "Location access denied", message: "We need access to your location in order to display the weather at your current location", preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        //Show error page

        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }

        alertController.addAction(openAction)

        loadingIndicatior.stopAnimating()
        self.present(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

