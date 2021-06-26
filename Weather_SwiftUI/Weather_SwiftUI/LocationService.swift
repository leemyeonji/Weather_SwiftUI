//
//  LocationService.swift
//  Weather_SwiftUI
//
//  Created by 임현지 on 2021/06/25.
//

import CoreLocation
import Foundation
import SwiftUI

public final class LocationService: NSObject  {
    private let locationManager = CLLocationManager()
    private var completionHandler: ((Location) -> Void)?
    //private let header: HTTPHeaders = ["Authorization" : "KakaoAK 2f49cbfe2d302c9668abbffe4a6e6bc8"]
    
    public func loadLocationData(_ completion: @escaping (Location) -> Void) {
        self.completionHandler = completion
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    public override init() {
        super.init()
        locationManager.delegate = self
    }
    
    public func makeLocationDataRequest(forCoordinates coordinates: CLLocationCoordinate2D) {
        guard let urlString =  "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x=\(coordinates.longitude)&y=\(coordinates.latitude)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: urlString) else { return }
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("KakaoAK 2f49cbfe2d302c9668abbffe4a6e6bc8", forHTTPHeaderField: "Authorization")
        request.addValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        print("request --> \(request)")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Unvalid response")
                return
            }
            guard let data = data else {
                print("Data is missing!")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(LocationResponse.self, from: data)
                self.completionHandler?(Location(response: data))
                print("data --> \(data)")
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}

extension LocationService: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        makeLocationDataRequest(forCoordinates: location.coordinate)
        print(location)
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Something went wrong:\(error.localizedDescription)")
    }
}

struct LocationResponse: Decodable {
    let documents: [LocationDocuments]
}

struct LocationDocuments: Decodable {
    let regionName: String
    
    enum CodingKeys: String, CodingKey {
        case regionName = "region_2depth_name"
    }
}
