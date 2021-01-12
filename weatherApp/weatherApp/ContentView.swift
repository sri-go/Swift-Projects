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
            LinearGradient(gradient:
                            Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                VStack(alignment: .center){
                    Text("New York")
                        .font(.system(size: 32, weight: .regular, design: .default))
                        .foregroundColor(.white)
                    
                    Text("Mostly Clear")
                        .font(.system(size: 18, weight: .regular, design: .default))
                        .foregroundColor(.white)
                    
                    Text("36°")
                        .font(.system(size: 96, weight:.thin))
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                    
                    HStack{
                        Text("H:43°")
                        Text("L:28°")
                    }
                    .font(.system(size: 18, weight:.regular, design: .default))
                    .foregroundColor(.white)
                    
                }.frame(width: 200, height: 200)
                
                Spacer().frame(height: 75)
                
                VStack{
                    ScrollView(.horizontal){
                        HStack{
                            VStack(alignment: .center, spacing: 10){
                                Text("12pm").foregroundColor(.white)
                                Image(systemName: "cloud.fill")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                               
                                Text("36°")
                                    .font(.system(size: 16, weight:.regular))
                                    .foregroundColor(.white)
                                
                            }.frame(width: 50, height: 100)
                            VStack(alignment: .center, spacing: 10){
                                Text("1pm").foregroundColor(.white)
                                Image(systemName: "cloud.fill")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                               
                                Text("36°")
                                    .font(.system(size: 16, weight:.regular))
                                    .foregroundColor(.white)
                                
                            }.frame(width: 50, height: 100)
                            VStack(alignment: .center, spacing: 10){
                                Text("2pm").foregroundColor(.white)
                                Image(systemName: "cloud.fill")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                               
                                Text("36°")
                                    .font(.system(size: 16, weight:.regular))
                                    .foregroundColor(.white)
                                
                            }.frame(width: 50, height: 100)
                            VStack(alignment: .center, spacing: 10){
                                Text("3pm").foregroundColor(.white)
                                Image(systemName: "cloud.fill")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                               
                                Text("36°")
                                    .font(.system(size: 16, weight:.regular))
                                    .foregroundColor(.white)
                                
                            }.frame(width: 50, height: 100)
                            VStack(alignment: .center, spacing: 10){
                                Text("4pm").foregroundColor(.white)
                                Image(systemName: "cloud.fill")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                               
                                Text("36°")
                                    .font(.system(size: 16, weight:.regular))
                                    .foregroundColor(.white)
                                
                            }.frame(width: 50, height: 100)
                            VStack(alignment: .center, spacing: 10){
                                Text("5pm").foregroundColor(.white)
                                Image(systemName: "cloud.fill")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                               
                                Text("36°")
                                    .font(.system(size: 16, weight:.regular))
                                    .foregroundColor(.white)
                                
                            }.frame(width: 50, height: 100)
                            VStack(alignment: .center, spacing: 10){
                                Text("6pm").foregroundColor(.white)
                                Image(systemName: "cloud.fill")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                               
                                Text("36°")
                                    .font(.system(size: 16, weight:.regular))
                                    .foregroundColor(.white)
                                
                            }.frame(width: 50, height: 100)
                            VStack(alignment: .center, spacing: 10){
                                Text("7pm").foregroundColor(.white)
                                Image(systemName: "cloud.fill")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                               
                                Text("36°")
                                    .font(.system(size: 16, weight:.regular))
                                    .foregroundColor(.white)
                                
                            }.frame(width: 50, height: 100)
                        }
                    }
                    
                }
                
                
                Divider().frame(height:1).background(Color.white)
               
                VStack(){
                    HStack(alignment: .center, spacing: 60){
                        Text("Monday").frame(width: 100, height: 15, alignment: .leading)
                        
                        Image(systemName: "cloud.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            
                        HStack{
                            Text("37").foregroundColor(.white)
                            Text("30").foregroundColor(.gray)
                        }.frame(width: 100, height: 15, alignment: .trailing)
                    }
                   
                    HStack(alignment: .center, spacing: 60){
                        Text("Tuesday")
                            .frame(width: 100, height: 15, alignment: .leading)
                        
                        Image(systemName: "cloud.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        
                        HStack{
                            Text("37").foregroundColor(.white)
                            Text("30").foregroundColor(.gray)
                        }.frame(width: 100, height: 15, alignment: .trailing)
                       
                    }
                    HStack(alignment: .center, spacing: 60){
                        Text("Wednesday").frame(width: 100, height: 15, alignment: .leading)
                        
                        Image(systemName: "cloud.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20, alignment: .center)
                        
                        HStack{
                            Text("37").foregroundColor(.white)
                            Text("30").foregroundColor(.gray)
                        }.frame(width: 100, height: 15, alignment: .trailing)
                       
                    }
                    HStack(alignment: .center, spacing: 60){
                        Text("Thursday").frame(width: 100, height: 15, alignment: .leading)
                        
                        Image(systemName: "cloud.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        
                        HStack{
                            Text("37").foregroundColor(.white)
                            Text("30").foregroundColor(.gray)
                        }.frame(width: 100, height: 15, alignment: .trailing)
                        
                    }
                    HStack(alignment:.center, spacing: 60){
                        Text("Friday").frame(width: 100, height: 15, alignment: .leading)
                        
                        Image(systemName: "cloud.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        
                        HStack{
                            Text("37").foregroundColor(.white)
                            Text("30").foregroundColor(.gray)
                        }.frame(width: 100, height: 15, alignment: .trailing)
                       
                    }
                    HStack(alignment: .center, spacing: 60){
                        Text("Saturday").frame(width: 100, height: 15, alignment: .leading)
                        
                        Image(systemName: "cloud.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        
                        HStack{
                            Text("37").foregroundColor(.white)
                            Text("30").foregroundColor(.gray)
                        }.frame(width: 100, height: 15, alignment: .trailing)
                       
                    }
                    HStack(alignment: .center, spacing: 60){
                        Text("Sunday").frame(width: 100, height: 15, alignment: .leading)
                        
                        Image(systemName: "cloud.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        
                        HStack{
                            Text("37").foregroundColor(.white)
                            Text("30").foregroundColor(.gray)
                        }.frame(width: 100, height: 15, alignment: .trailing)
                       
                    }
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

