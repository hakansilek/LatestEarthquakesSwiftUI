//
//  MapView.swift
//  LastEarthquakeSwiftUI
//
//  Created by Hakan Silek on 11.12.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let coordinate:CLLocationCoordinate2D
    init(latitude:Double, longitude: Double) {
        coordinate = CLLocationCoordinate2D(
        latitude: latitude, longitude: longitude)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 1.5, longitudeDelta: 1.5)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        let point = MKPointAnnotation()
        point.coordinate = coordinate
        view.setRegion(region, animated: true)
        view.addAnnotation(point)
    }
}

struct MapView_Preview: PreviewProvider{
    static var previews: some View{
        MapView(latitude: 34.011286, longitude: -116.166868)
    }
}


