//
//  EarthQuakesList.swift
//  LastEarthquakeSwiftUI
//
//  Created by Hakan Silek on 15.12.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import SwiftUI

struct EarthQuakesList: View {
    @ObservedObject var networkManager:NetworkManager
    init(querySring:String) {
        networkManager = NetworkManager(queryParams: querySring)
        networkManager.getEarthQuakes()
    }
    var body: some View {
        ActivityIndicatorView(isShowing: networkManager.earthQuakes.count<1) {
            List(self.networkManager.earthQuakes){ earthQuake in
                NavigationLink(destination: EarthQuakeDetail(latitude: earthQuake.location.coordinates[1], longitude: earthQuake.location.coordinates[0])) {
                    VStack(alignment: .leading){
                        Text("Place: \(earthQuake.earthQuake.place)").font(.headline)
                        Text("Magnitude: \(earthQuake.earthQuake.mag)")
                        Text("Time: \(earthQuake.earthQuake.time)")
                    }
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.networkManager.getEarthQuakes()
            }, label: {
                Image(systemName: "goforward")
            }))
        }
    }
    
    struct EarthQuakesList_Previews: PreviewProvider {
        static var previews: some View {
            EarthQuakesList(querySring: "")
        }
    }
}
