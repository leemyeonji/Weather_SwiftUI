//
//  LocationViewModel.swift
//  Weather_SwiftUI
//
//  Created by 임현지 on 2021/06/26.
//

import Foundation
import SwiftUI

public class LocationViewModel: ObservableObject {
    @Published var regionName: String = "대전"
    
    public let locationService: LocationService
    
    public init(locationService: LocationService) {
        self.locationService = locationService
    }
    
    public func fetching() {
        locationService.loadLocationData { location in
            DispatchQueue.main.async {
                self.regionName = location.regionName
            }
        }
    }
}
