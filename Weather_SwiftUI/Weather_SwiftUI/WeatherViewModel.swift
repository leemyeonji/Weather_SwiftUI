//
//  WeatherViewModel.swift
//  Weather_SwiftUI
//
//  Created by 임현지 on 2021/06/11.
//

import Foundation
import SwiftUI

let defaultIcon = "cloud.fill"

enum IconMap: String, CaseIterable {
    case Drizzle = "cloud.snow.fill"
    case Thunderstorm = "cloud.bolt.fill"
    case Rain = "cloud.rain.fill"
    case Snow = "snow"
    case Clear = "sun.max.fill"
    case Clouds = "smoke.fill"
}

public class WeatherViewModel : ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--℃"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon = defaultIcon
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh() {
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)℃"
                self.weatherDescription = weather.description
                self.weatherIcon = "\(IconMap.allCases.filter{ $0.rawValue == weather.iconName})"
            }
        }
    }
}
