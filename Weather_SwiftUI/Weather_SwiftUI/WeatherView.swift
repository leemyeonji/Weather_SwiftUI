//
//  ContentView.swift
//  Weather_SwiftUI
//
//  Created by 임현지 on 2021/06/11.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    @State var appear = false
    
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .fill(LinearGradient(
                            gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 1, green: 0.4833333492279053, blue: 0.7933335304260254, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 1, green: 0.7733333110809326, blue: 0.4333333373069763, alpha: 0.46000000834465027)), location: 1)]),
                            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
                    .frame(width: 500, height: 500)
                    .offset(x: appear ? 100 : 10, y: 10.0)
                
                Circle()
                    .fill(LinearGradient(
                            gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 0.949999988079071, green: 0.18604165315628052, blue: 0.6902540326118469, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0.9607843160629272, green: 0.5411764979362488, blue: 0.14509804546833038, alpha: 0)), location: 1),
                        .init(color: Color(#colorLiteral(red: 0.43921568989753723, green: 0.3803921639919281, blue: 0.6392157077789307, alpha: 1)), location: 1)]),
                            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
                    .frame(width: 600, height: appear ? 100 : 700)
            }
            .mask(ClearBackground())
            .blur(radius: 40)
            .offset(x: -100, y: -100)
            .onAppear{
                withAnimation(.linear(duration: 5)) {
                    appear = true
                }
            }
            
            VStack {
                Text(viewModel.cityName)
                    .font(.largeTitle)
                    .padding()
                Text(viewModel.temperature)
                    .font(.system(size: 70))
                    .bold()
                viewModel.weatherIcon
                    .font(.system(size: 120))
                    .foregroundColor(Color.white)
                    .padding()
                    .shadow(color: Color(#colorLiteral(red: 0.43921568989753723, green: 0.3803921639919281, blue: 0.6392157077789307, alpha: 1)), radius: 40, x: 0, y: 20)
                Text(viewModel.weatherDescription)
            }
            .onAppear(perform: {
                viewModel.refresh()
        })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
