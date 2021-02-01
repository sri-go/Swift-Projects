//
//  WeatherAPIService.swift
//  simpleWeather
//
//  Created by Sri Gowda on 1/30/21.
//

import Foundation
import CoreLocation

public final class WeatherService: NSObject {
    private let locationManager = CLLocationManager()
    private let API_KEY = ""
    private var completionHandler: ((WeatherModel) -> Void)?
        
    public func loadWeatherData(_ completionHandler: @escaping((WeatherModel) -> Void)) {
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func makeDatatRequest(forCoordinates coordinates: CLLocationCoordinate2D){
        guard let urlString = "sfa" else { return }
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data , response, error in
            guard error == nil, let data = data else { return }
            if let  response = try? JSONDecoder.decode(APIResponse.self, from: data) {
                self.completionHandler?(WeatherModel(response: response))
            }
        }.resume() 
    }
}

struct APIResponse: Decodable {
    let name: String
    let main: APIMain
    let weather: [APIWeather]
}

struct APIMain: Decodable {
    let temp: Double
}

struct APIWeather: Decodable {
    let description: String
    let iconName: String
    
    
    enum CodingKeys: String, CodingKey {
        case description
        case iconName = "main"
    }
}
