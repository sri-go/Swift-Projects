//
//  WeatherViewModel.swift
//  simpleWeather
//
//  Created by Sri Gowda on 1/30/21.
//

import Foundation

public class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "Temp"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = "City Name"
    
    public let weatherService: WeatherService
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
}
