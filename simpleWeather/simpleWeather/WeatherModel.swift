//
//  WeatherModel.swift
//  simpleWeather
//
//  Created by Sri Gowda on 1/30/21.
//

import Foundation

struct WeatherModel {
    let city: String
    let temperature: String
    let description: String
    let iconName: String
    
    init(response: APIResponse){
        city = response.name
        temperature = "\(Int(response.main.temp))"
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.iconName ?? ""
    }
    
    
}
