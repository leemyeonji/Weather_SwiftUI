//
//  Location.swift
//  Weather_SwiftUI
//
//  Created by 임현지 on 2021/06/25.
//

import Foundation

public struct Location {
    let regionName: String
    
    init(response: LocationResponse) {
        regionName = response.documents.first?.regionName ?? ""
    }
}
