//
//  EarthQuakePresentation.swift
//  LastEarthquakeSwiftUI
//
//  Created by Hakan Silek on 12.12.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


struct EarthQuakePresentation: Identifiable{
    let id = UUID()
    let earthQuake: EarthQuake
    let location: EarthQuakeLocation
}
