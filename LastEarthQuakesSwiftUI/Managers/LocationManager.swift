//
//  LocationManager.swift
//  LastEarthquakeSwiftUI
//
//  Created by Hakan Silek on 12.12.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//


import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private var manager = CLLocationManager()
    @Published var locationStatus:CLAuthorizationStatus = .notDetermined
    @Published var location = CLLocation()
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func locationServiceRequest(){
        manager.requestWhenInUseAuthorization()
    }
    
    func startUpdating()  {
        manager.startUpdatingLocation()
    }
    func stopUpdating() {
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            self.location = location
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        if(locationStatus == .authorizedWhenInUse){
            startUpdating()
        }
    }
}
