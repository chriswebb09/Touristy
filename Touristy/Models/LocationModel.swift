//
//  Locations.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/10/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import MapKit

struct Location {
    let latitude: CGFloat
    let longitude: CGFloat
    let coordinate: CLLocationCoordinate2D
    let locationName: String
    var trivia: String
    var images: UIImage?
    
    init(latitude:CGFloat, longitude:CGFloat, coordinate: CLLocationCoordinate2D, locationName: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.coordinate = coordinate
        self.locationName = locationName
        self.trivia = " "
        self.images = nil
    }
}
