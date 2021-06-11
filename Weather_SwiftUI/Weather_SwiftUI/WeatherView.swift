//
//  ContentView.swift
//  Weather_SwiftUI
//
//  Created by 임현지 on 2021/06/11.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.cityName)
                .font(.largeTitle)
                .padding()
            Text(viewModel.temperature)
                .font(.system(size: 70))
                .bold()
            Image(systemName: viewModel.weatherIcon)
                .renderingMode(.original)
                .font(.largeTitle)
                .foregroundColor(.yellow)
                .frame(width: 80, height: 80)
            Text(viewModel.weatherDescription)
        }
        .onAppear(perform: {
            viewModel.refresh()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
