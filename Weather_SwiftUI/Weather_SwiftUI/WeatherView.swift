//
//  ContentView.swift
//  Weather_SwiftUI
//
//  Created by 임현지 on 2021/06/11.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        VStack {
            Text("Seoul")
                .font(.largeTitle)
                .padding()
            Text("0℃")
                .font(.system(size: 70))
                .bold()
            Image(systemName: "cloud.sun.fill")
                .font(.largeTitle)
            Text("Clear Sky")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
