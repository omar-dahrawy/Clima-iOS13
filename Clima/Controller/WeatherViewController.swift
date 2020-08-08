//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var conditionLabel: UILabel!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    let backGround = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backGround.colors = [UIColor(red: 168/255, green: 216/255, blue: 234/255, alpha: 1).cgColor, UIColor(red: 1, green: 1, blue: 210/255, alpha: 1).cgColor]
        backGround.frame = view.frame
        backGround.startPoint = CGPoint(x: 0.5,y: 0)
        view.layer.addSublayer(backGround)
        view.layer.insertSublayer(backGround, at: 0)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        weatherManager.delegate = self
        searchTextField.delegate = self
    }
    
    @IBAction func getWeatherByLocation(_ sender: UIButton) {
        locationManager.startUpdatingLocation()
    }
    
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn (_ textfield: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
            
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, _ weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.imageName)
            self.cityLabel.text = weather.cityName
            self.backGround.colors = weather.bgColor
            self.backGround.endPoint = weather.endPoint
            self.conditionLabel.text = weather.conditionName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

//MARK: - CLLManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: long)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
