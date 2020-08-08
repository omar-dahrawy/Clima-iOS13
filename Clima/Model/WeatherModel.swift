//
//  WeatherModel.swift
//  Clima
//
//  Created by Omar Al-Dahrawy on 7/27/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temp: Double
    
    var temperatureString: String {
        return String(format: "%.0f", temp)
    }
    
    var imageName: String {
         switch conditionId {
               case 200...232:
                   return "cloud.bolt"
               case 300...321:
                   return "cloud.drizzle"
               case 500...531:
                   return "cloud.rain"
               case 600...622:
                   return "cloud.snow"
               case 700...781:
                   return "cloud.fog"
               case 800:
                   return "sun.max"
               case 801...804:
                   return "cloud"
               default:
                   return "cloud"
               }
    }
    
    var bgColor: [CGColor] {
        switch conditionId {
        case 200...232:
            return [UIColor(red: 34/255, green: 40/255, blue: 49/255, alpha: 1).cgColor, UIColor(red: 193/255, green: 165/255, blue: 123/255, alpha: 1).cgColor]
        case 300...321:
            return [UIColor(red: 15/255, green: 76/255, blue: 117/255, alpha: 1).cgColor, UIColor(red: 0, green: 183/255, blue: 194/255, alpha: 1).cgColor]
        case 500...531:
            return [UIColor(red: 27/255, green: 38/255, blue: 44/255, alpha: 1).cgColor, UIColor(red: 15/255, green: 76/255, blue: 117/255, alpha: 1).cgColor]
        case 600...622:
            return [UIColor.darkGray.cgColor, UIColor.white.cgColor]
        case 700...781:
            return [UIColor.darkGray.cgColor, UIColor.lightGray.cgColor]
        case 800:
            return [UIColor.orange.cgColor, UIColor.red.cgColor]
        case 801...804:
            return [UIColor(red: 34/255, green: 40/255, blue: 49/255, alpha: 1).cgColor, UIColor(red: 48/255, green: 71/255, blue: 94/255, alpha: 1).cgColor]
        default:
            return [UIColor(red: 168/255, green: 216/255, blue: 234/255, alpha: 1).cgColor, UIColor(red: 1, green: 1, blue: 210/255, alpha: 1).cgColor]
        }
    }
    
    var endPoint: CGPoint {
        switch conditionId {
        case 200...232:
            return CGPoint(x: 0.5,y: 2)
        case 300...321:
            return CGPoint(x: 0.5,y: 1)
        case 500...531:
            return CGPoint(x: 0.5,y: 1)
        case 600...622:
            return CGPoint(x: 0.5,y: 1)
        case 700...781:
            return CGPoint(x: 0.5,y: 2)
        case 800:
            return CGPoint(x: 0.5,y: 1)
        case 801...804:
            return CGPoint(x: 0.5,y: 1)
        default:
            return CGPoint(x: 0.5,y: 1)
        }
    }
    
    var conditionName: String {
         switch conditionId {
               case 200...232:
                   return "Thunderstorm"
               case 300...321:
                   return "Drizzle"
               case 500...531:
                   return "Rain"
               case 600...622:
                   return "Snow"
               case 700...781:
                   return "Fog"
               case 800:
                   return "Clear"
               case 801...804:
                   return "Cloudy"
               default:
                   return "n/a"
               }
    }
    
}
