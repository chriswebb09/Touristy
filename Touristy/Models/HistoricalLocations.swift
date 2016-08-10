//
//  HistoricalLocations.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/10/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import MapKit

class HistoricalLocation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D
    let distance: CLLocationDistance
    let halo: CLCircularRegion
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D, distance: CLLocationDistance) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        self.distance = distance
        self.halo = CLCircularRegion(center:self.coordinate, radius: 100, identifier: locationName)
    }
    
    convenience override init() {
        self.init(title: "No Location", locationName: "None", coordinate:(CLLocationCoordinate2D(latitude: 0.0000, longitude: 0.0000)), distance: 0.0000)
    }
    
    func getTriviaForLocation() -> String {
        return "No trivia"
    }
    
    func getImages() {
        
    }
}
