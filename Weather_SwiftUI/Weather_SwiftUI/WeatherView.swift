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
                        .init(color: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0.952721417, green: 0.6861653328, blue: 0.1451541781, alpha: 0.01978135267)), location: 1)]),
                            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
                    .frame(width: 500, height: 500)
                    .offset(x: 10, y: 10.0)
                
                Circle()
                    .fill(LinearGradient(
                            gradient: Gradient(stops: [
                        .init(color: Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), location: 0),
                        .init(color: Color(#colorLiteral(red: 0.9607843160629272, green: 0.5411764979362488, blue: 0.14509804546833038, alpha: 0)), location: 1),
                        .init(color: Color(#colorLiteral(red: 0.5472166538, green: 0.2308993638, blue: 0.8218681216, alpha: 1)), location: 1)]),
                            startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
                            endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999)))
                    .frame(width: 600, height: appear ? CGFloat(100.0) : 700.0)
            }
            .mask(ClearBackground())
            .blur(radius: 40)
            .overlay(Image("Texture").opacity(0.1))
            .mask(ClearBackground())
            .blur(radius: 40)
            
            
            //.offset(x: appear ? 100.0 : -100.0, y: appear ? 100.0 : -100.0)
            
            
            VStack {
                Text(viewModel.cityName)
                    .font(.title3)
                    .bold()
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                VStack {
                    viewModel.weatherIcon
                        .font(.system(size: 150))
                        .foregroundColor(Color.white)
                        .blendMode(.colorBurn)
                        .shadow(color: Color(#colorLiteral(red: 0.43921568989753723, green: 0.3803921639919281, blue: 0.6392157077789307, alpha: 1)).opacity(0.6), radius: appear ? 10 : 30, x: appear ? 0 : 10, y: 20)
                        .padding(.bottom)
                        
                        
                    Text(viewModel.weatherDescription)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 30)
                }
                .padding(.vertical)
                
               // Spacer()
                
//                Text(viewModel.temperature)
//                    .font(.system(size: 80, weight: .bold, design: .default                    ))
//                    .padding(.vertical)
//                    .padding(.bottom, 50)
//
                
                
            }
            .frame(width: 350, alignment: .leading)
            .padding()
            .onAppear{
                viewModel.refresh()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.bottom)
        .onAppear{
            withAnimation(.linear(duration: 5).repeatForever()) {
                appear = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
