//
//  LocalizedAllEarthQuakes.swift
//  LastEarthquakeSwiftUI
//
//  Created by Hakan Silek on 3.12.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import SwiftUI

struct LocalizedAllEarthQuakes: View {
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        NavigationView{
            if(locationManager.locationStatus == .notDetermined){
                VStack {
                    Text("This page depends on your location.")
                    Text("Please enable location services")
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    Button(action: {
                        self.locationManager.locationServiceRequest()
                    }) {
                        Text("Enable")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(5)
                    }
                }
            }else if(locationManager.locationStatus == .authorizedWhenInUse){
                EarthQuakesList(querySring: "latitude=\(locationManager.location.coordinate.latitude)&longitude=\(locationManager.location.coordinate.longitude)&maxradiuskm=500")
                    .navigationBarTitle("Your Location")
            }else{
                Text("Please enable location services on settings.")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(Color.green)
                
            }
        }
    }
}

struct LocalizedAllEarthQuakes_Previews: PreviewProvider {
    static var previews: some View {
        LocalizedAllEarthQuakes()
    }
}
