//
//  HistoricalLocations.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/10/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import MapKit

class HistoricalLocation: NSObject, MKAnnotation {
    // MARK: - Properties

    let title: String?
    let locationName: String?
    let coordinate: CLLocationCoordinate2D
    let distance: CLLocationDistance
    let halo: CLCircularRegion
    
    // MARK: - Initialization
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D, distance: CLLocationDistance) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        self.distance = distance
        self.halo = CLCircularRegion(center:self.coordinate, radius: 100, identifier: locationName)
    }
    
    // MARK: - Convenience override init 
    
    convenience override init() {
        self.init(title: "No Location", locationName: "None", coordinate:(CLLocationCoordinate2D(latitude: 0.0000, longitude: 0.0000)), distance: 0.0000)
    }
    
    func getTriviaForLocation() -> String {
        
        // TODO: - Need to implement trivia functionality
        
        return "No trivia"
    }
    
    func getImages() {
        
        // TODO: - Need to implement retrieve images for triva and location
        
    }
}
