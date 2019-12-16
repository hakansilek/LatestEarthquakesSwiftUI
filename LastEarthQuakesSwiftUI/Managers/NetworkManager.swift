//
//  NetworkManager.swift
//  LastEarthquakeSwiftUI
//
//  Created by Hakan Silek on 10.12.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import SwiftUI


class NetworkManager: ObservableObject{
    let url:URL
    var baseURL = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&"
    @Published var earthQuakes = [EarthQuakePresentation]()
    
    init(queryParams: String){
        baseURL = baseURL + queryParams + "&limit=30"
        url = URL(string: baseURL)!
    }
    func getEarthQuakes() {
        earthQuakes = []
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            guard let decoded = try? Decoders.plainDateDecoder.decode(EarthQuakeResponse.self, from: data)else{
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")"); return
            }
            DispatchQueue.main.async {
                self.earthQuakes = decoded.earthQuakes
            }
        }.resume()
    }
}
