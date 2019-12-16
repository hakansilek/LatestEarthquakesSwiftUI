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
        queryString = "starttime=2019-12-01&endtime=2019-12-31"
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
