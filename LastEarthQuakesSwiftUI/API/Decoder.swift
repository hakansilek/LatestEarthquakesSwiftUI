//
//  Decoder.swift
//  LastEarthquakeSwiftUI
//
//  Created by Hakan Silek on 9.12.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation

public enum Decoders {
    public static let plainDateDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return decoder
    }()
}
