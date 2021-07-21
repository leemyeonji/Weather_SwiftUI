//
//  ContentView.swift
//  Weather_SwiftUI
//
//  Created by 임현지 on 2021/06/11.
//

import SwiftUI
import SceneKit

struct WeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    @ObservedObject var locationViewModel: LocationViewModel
    
    @State var appear = false
    var sceneManager = SceneManager()
    
    
    
    //var animation = animationFromSceneNamed(path: "prototype")
    
    var body: some View {
        ZStack {
            SceneView(scene: sceneManager.scene, options: [.autoenablesDefaultLighting, .allowsCameraControl])
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                //.foregroundColor(.blue)
            
//
//
//            VStack {
//                Text(viewModel.cityName)
//                    .font(.title3)
//                    .bold()
//                    .padding(.vertical)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//
//
//                Spacer()
//
//                VStack {
//                    viewModel.weatherIcon
//                        .font(.system(size: 150))
//                        .foregroundColor(Color.white)
//                        .blendMode(.colorBurn)
//                        .shadow(color: Color(#colorLiteral(red: 0.43921568989753723, green: 0.3803921639919281, blue: 0.6392157077789307, alpha: 1)).opacity(0.6), radius: appear ? 10 : 30, x: appear ? 0 : 10, y: 20)
//                        .padding(.bottom)
//
//
//                    Text(viewModel.weatherDescription)
//                        .foregroundColor(.secondary)
//                        .padding(.bottom, 30)
//                }
//                .padding(.vertical)
//
//               // Spacer()
//
////                Text(viewModel.temperature)
////                    .font(.system(size: 80, weight: .bold, design: .default                    ))
////                    .padding(.vertical)
////                    .padding(.bottom, 50)
////
//
//
//            }
//            .frame(width: 350, alignment: .leading)
//            .padding()
//            .onAppear{
//                viewModel.refresh()
//
//            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.bottom)
        .onAppear{
            withAnimation(.linear(duration: 5).repeatForever()) {
                appear = true
            }
            locationViewModel.fetching()
        }
    }
    
    

}

func animationFromSceneNamed(path: String) -> CAAnimation? {
    let scene  = SCNScene(named: path)
    var animation:CAAnimation?
    scene?.rootNode.enumerateChildNodes({ child, stop in
        if let animKey = child.animationKeys.first {
            animation = child.animation(forKey: animKey)
            stop.pointee = true
        }
    })
    return animation
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()), locationViewModel: LocationViewModel(locationService: LocationService()))
    }
}
