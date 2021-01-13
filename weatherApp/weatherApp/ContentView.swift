//
//  ContentView.swift
//  weatherApp
//
//  Created by Sri Gowda on 1/9/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            BackgroundView(topColor: Color("darkBlue"), bottomColor: Color("lightBlue"))
            VStack{
                WeatherOverview(cityName: "New York",
                                weather: "Mostly Clear",
                                currentTemp: 36,
                                highTemp: 43,
                                lowTemp: 28)
                                
                 VStack{
                    ScrollView(.horizontal){
                        HStack{
                            WeatherHourlyView(Time: "12pm",
                                              ImageName: "cloud.fill",
                                              Temp: 36)
                            WeatherHourlyView(Time: "12pm",
                                              ImageName: "cloud.fill",
                                              Temp: 36)
                            WeatherHourlyView(Time: "12pm",
                                              ImageName: "cloud.fill",
                                              Temp: 36)
                            WeatherHourlyView(Time: "12pm",
                                              ImageName: "cloud.fill",
                                              Temp: 36)
                            WeatherHourlyView(Time: "12pm",
                                              ImageName: "cloud.fill",
                                              Temp: 36)
                            WeatherHourlyView(Time: "12pm",
                                              ImageName: "cloud.fill",
                                              Temp: 36)
                            WeatherHourlyView(Time: "12pm",
                                              ImageName: "cloud.fill",
                                              Temp: 36)
                            WeatherHourlyView(Time: "12pm",
                                              ImageName: "cloud.fill",
                                              Temp: 36)
                            WeatherHourlyView(Time: "12pm",
                                              ImageName: "cloud.fill",
                                              Temp: 36)
                            WeatherHourlyView(Time: "12pm",
                                              ImageName: "cloud.fill",
                                              Temp: 36)
                        }
                    }
                    
                }
                
                Divider().frame(height:1).background(Color.white) 
               
                VStack(){
                    WeatherWeekView(dayOfWeek: "Monday",
                                    imageName: "cloud.fill",
                                    tempHigh: 37,
                                    tempLow: 30)
                    WeatherWeekView(dayOfWeek: "Tuesday",
                                    imageName: "cloud.fill",
                                    tempHigh: 37,
                                    tempLow: 30)
                    WeatherWeekView(dayOfWeek: "Wednesday",
                                    imageName: "cloud.fill",
                                    tempHigh: 37,
                                    tempLow: 30)
                    WeatherWeekView(dayOfWeek: "Thursday",
                                    imageName: "cloud.fill",
                                    tempHigh: 37,
                                    tempLow: 30)
                    WeatherWeekView(dayOfWeek: "Friday",
                                    imageName: "cloud.fill",
                                    tempHigh: 37,
                                     tempLow: 30)
                    WeatherWeekView(dayOfWeek: "Saturday", imageName: "cloud.fill", tempHigh: 37, tempLow: 30)
                    WeatherWeekView(dayOfWeek: "Sunday", imageName: "cloud.fill", tempHigh: 37, tempLow: 30)
                }.font(.system(size: 16, weight:.regular, design: .default))
                .foregroundColor(.white)
               
                Divider().frame(height:1).background(Color.white)
                
            }
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}


struct WeatherWeekView: View {
    
    var dayOfWeek: String;
    var imageName: String;
    var tempHigh: Int;
    var tempLow: Int;
    
    var body: some View {
        HStack(alignment: .center, spacing: 60){
            Text(dayOfWeek).frame(width: 100, height: 15, alignment: .leading)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            
            HStack{
                Text("\(tempHigh)").foregroundColor(.white)
                Text("\(tempLow)").foregroundColor(.gray)
            }.frame(width: 100, height: 15, alignment: .trailing)
        }
    }
}

struct WeatherHourlyView: View {
    var Time: String
    var ImageName: String
    var Temp: Int
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            Text(Time).foregroundColor(.white)
            Image(systemName: ImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            
            Text("\(Temp)°")
                .font(.system(size: 16, weight:.regular))
                .foregroundColor(.white)
            
        }.frame(width: 50, height: 100)
    }
}

struct BackgroundView: View {
    
    var topColor: Color;
    var bottomColor: Color;
    
    var body: some View {
        LinearGradient(gradient:
                        Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}


struct WeatherOverview: View {
    var cityName: String;
    var weather: String;
    var currentTemp: Int;
    var highTemp: Int;
    var lowTemp: Int;
    
    var body: some View {
        VStack(alignment: .center){
           Text(cityName)
               .font(.system(size: 32, weight: .regular, design: .default))
               .foregroundColor(.white)
           
           Text(weather)
               .font(.system(size: 18, weight: .regular, design: .default))
               .foregroundColor(.white)
           
           Text("\(currentTemp)°")
               .font(.system(size: 96, weight:.thin))
               .foregroundColor(.white)
               .padding(.leading, 20)
           
           HStack{
               Text("H:\(highTemp)°")
               Text("L:\(lowTemp)°")
           }
           .font(.system(size: 18, weight:.regular, design: .default))
           .foregroundColor(.white)
           
        }.frame(width: 200, height: 200).padding(.bottom, 60)
    }
}
