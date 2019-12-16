//
//  EarthQuakeResponse.swift
//  LastEarthquakeSwiftUI
//
//  Created by Hakan Silek on 11.12.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation

struct EarthQuakeResponse: Decodable {
    var earthQuakes = [EarthQuakePresentation]()
    
    private enum RootCodingKey: String, CodingKey{
        case features
    }
    public init(from decoder: Decoder) throws{
        let root = try decoder.container(keyedBy: RootCodingKey.self)
        let features = try root.decode([Feature].self, forKey: .features)
        for feature in features {
            let earthQuakePresentation = EarthQuakePresentation(earthQuake: feature.properties, location: feature.geometry)
            earthQuakes.append(earthQuakePresentation)
        }
    }
}

struct Feature: Decodable {
    let properties:EarthQuake
    let geometry:EarthQuakeLocation
}

struct EarthQuakeLocation: Decodable{
    let coordinates:[Double]
}

struct EarthQuake: Decodable {
    let place:String
    let mag:String
    let time:String
    
    init(from decoder: Decoder) throws {
        let object = try decoder.container(keyedBy: CodingKeys.self)
        place = try object.decode(String.self, forKey: .place)
        let magnitude = try object.decode(Float.self, forKey: .mag)
        mag = String(format: "%.1f", magnitude)
        let date = try object.decode(Date.self, forKey: .time)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        time = dateFormatter.string(from: date)
    }

    private enum CodingKeys: String, CodingKey{
        case place, mag, time
    }
}

