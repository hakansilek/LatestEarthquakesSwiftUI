//
//  ContentView.swift
//  LastEarthquakeSwiftUI
//
//  Created by Hakan Silek on 3.12.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AllEarthQuakes()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("In The World")
            }.tag(0)
           LocalizedAllEarthQuakes()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("In Your Location")
            }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
