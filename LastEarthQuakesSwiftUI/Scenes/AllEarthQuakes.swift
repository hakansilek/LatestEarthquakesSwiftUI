//
//  AllEarthQuakes.swift
//  LastEarthquakeSwiftUI
//
//  Created by Hakan Silek on 3.12.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import SwiftUI
import Combine


struct AllEarthQuakes: View {
    let queryString:String
    init() {
        let startOfDay = Date().startOfMonth()
        let endOfDay = Date().endOfMonth()
        queryString = "starttime=\(startOfDay)&endtime=\(endOfDay)"
    }
    var body: some View {
        NavigationView{
            EarthQuakesList(querySring: queryString)
            .navigationBarTitle("World")
        }
    }
}

struct AllEarthQuakes_Previews: PreviewProvider {
    static var previews: some View {
        AllEarthQuakes()
    }
}
