//
//  WeatherViewModel.swift
//  Weather_SwiftUI
//
//  Created by 임현지 on 2021/06/11.
//

import Foundation
import SwiftUI

let defaultIcon = "cloud.fill"

let iconMap = [
    "Drizzle" : "cloud.snow.fill",
    "Thunderstorm" : "cloud.bolt.fill",
    "Rain" : "cloud.rain.fill",
    "Snow" : "snow",
    "Clear" : "sun.max.fill",
    "Clouds" : "smoke.fill"
    //"Haze", "Dust", "Atmosphere", "Smoke","Fog", "Squall"
]

public class WeatherViewModel : ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--℃"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon = Image(systemName: defaultIcon)
    
    public let weatherService: WeatherService
    
    public init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh() {
        weatherService.loadWeatherData { [weak self] weather in
            DispatchQueue.main.async {
                self?.cityName = (self?.weatherService.localCityName)!
                self?.temperature = "\(weather.temperature)℃"
                self?.weatherDescription = weather.description.uppercased()
                self?.weatherIcon = Image(systemName: iconMap[weather.iconName]!)
            }
        }
    }
}
