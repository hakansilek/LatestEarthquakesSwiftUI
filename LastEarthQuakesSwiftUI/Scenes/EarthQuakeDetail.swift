//
//  EarthQuakeDetail.swift
//  LastEarthquakeSwiftUI
//
//  Created by Hakan Silek on 11.12.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import SwiftUI

struct EarthQuakeDetail: View {
    let latitude:Double
    let longitude:Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var body: some View {
        MapView(latitude: latitude, longitude: longitude)
    }
}

struct EarthQuakeDetail_Previews: PreviewProvider {
    static var previews: some View {
        EarthQuakeDetail(latitude: 34.011286, longitude: -116.166868)
    }
}
