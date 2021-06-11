//
//  Weather_SwiftUIApp.swift
//  Weather_SwiftUI
//
//  Created by 임현지 on 2021/06/11.
//

import SwiftUI

@main
struct Weather_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            WeatherView(viewModel: viewModel)
        }
    }
}
