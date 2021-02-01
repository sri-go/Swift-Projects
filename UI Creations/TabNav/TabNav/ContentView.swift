//
//  ContentView.swift
//  TabNav
//
//  Created by Sri Gowda on 1/31/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab(num: 1, color: Color.green).tabItem { Image(systemName: "house")
                Text("home")
            }
            Tab(num: 2, color: Color.red).tabItem { Image(systemName: "car")
                Text("home")
            }
            Tab(num: 3, color: Color.blue).tabItem { Image(systemName: "map")
                Text("home")
            }
        }
    }
}

struct Tab: View {
    let num: Int
    let color: Color
    
    var body: some View {
        ZStack {
            Circle().fill(color).scaleEffect(CGSize(width: 0.50, height: 0.50))
            Text("\(num)")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .light))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
