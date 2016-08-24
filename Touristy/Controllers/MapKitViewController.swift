//
//  MapKitViewController.swift
//  Touristy
//
//  Created by Christopher Webb-Orenstein on 8/13/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController, MKMapViewDelegate  {
    // MARK: - Properties 
    
    // MARK: - Historical location properties 
    
    var trinityChurch = HistoricalLocation()
    var saintPauls = HistoricalLocation()
    var federalHall = HistoricalLocation()
    var frauncesTavern = HistoricalLocation()
    var bowlingGreen = HistoricalLocation()
    var historicalLocal: [String: HistoricalLocation]?
    
    // MARK: - Setup map view, initial location, region radius, location manager 
    
    let mapView: MKMapView! = MKMapView()
    var initialLocation = CLLocation(latitude: 34.4248, longitude: -118.5971)
    let regionRadius: CLLocationDistance = 1000
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        self.mapView.delegate = self
        
        // MARK: - Instantiate HistoricalLocations 
        
        self.trinityChurch = HistoricalLocation(
            title: "Start",
            locationName: "Trinity Church",
            coordinate: CLLocationCoordinate2D(
                latitude: 40.708144,
                longitude: -74.012047),
            distance: CLLocationDistance(200))
        
        
        self.federalHall = HistoricalLocation(
            title: "Federal Hall",
            locationName: "Federal Hall",
            coordinate: CLLocationCoordinate2D(
                latitude: 40.7074,
                longitude: -74.00594130000002),
            distance: CLLocationDistance(200))
        
        self.frauncesTavern = HistoricalLocation(
            title: "Fraunces Tavern",
            locationName: "Fraunces Tavern",
            coordinate: CLLocationCoordinate2D(
                latitude: 40.7127837,
                longitude: -74.00594130000002),
            distance: CLLocationDistance(200))
        
        self.bowlingGreen = HistoricalLocation(
            title: "Bowling Green",
            locationName: "Bowling Green",
            coordinate: CLLocationCoordinate2D(
                latitude: 40.704567,
                longitude: -74.013799),
            distance: CLLocationDistance(200))
        
        self.saintPauls = HistoricalLocation(
            title: "St Pauls",
            locationName: "St Pauls",
            coordinate: CLLocationCoordinate2D(
                latitude: 40.7127837,
                longitude: -74.00594130000002),
            distance: CLLocationDistance(200))
        
        // MARK: - Collect HistoricalLocation objects into collection
        
        self.historicalLocal = ["Trinity" : self.trinityChurch,
                                "St Pauls" : self.saintPauls,
                                "Federal Hall" : self.federalHall,
                                "Fraunces Tavern" : self.frauncesTavern,
                                "Bowling Green" : self.bowlingGreen]
        self.mapView.frame = view.frame
        self.view.addSubview(self.mapView)
        self.centerMapOnLocation(self.initialLocation)
    }
    
    // MAKE: - Center the map on a given location
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0,
                                                                  regionRadius * 2.0)
        self.mapView.setRegion(coordinateRegion,
                               animated: true)
    }
    
    // MARK: - Render circle on mapview 
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        
        let circleRenderer = MKCircleRenderer(overlay: overlay)
        circleRenderer.fillColor = UIColor.blueColor().colorWithAlphaComponent(0.1)
        circleRenderer.strokeColor = UIColor.blueColor()
        circleRenderer.lineWidth = 1
        return circleRenderer
    }

}

    

//
//    func centerMapOnLocation(location: CLLocation) {
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, self.regionRadius * 2.0, self.regionRadius * 2.0)
//        self.mapView.setRegion(coordinateRegion, animated: true)
//    }
//    func loadOverlayForRegionWithLatitude(latitude: Double, andLongitude longitude: Double) {
//        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        circle = MKCircle(centerCoordinate: coordinates, radius: 200000)
//        self.mapView.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7)), animated: true)
//        self.mapView.addOverlay(circle)
//    }

extension MapKitViewController: CLLocationManagerDelegate {
    // MARK: - getUserLocation()
        func getUserLocation() -> CLLocation? {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.startMonitoringSignificantLocationChanges()
            
            let userAuthorized = (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse || CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedAlways)
            if userAuthorized { return self.locationManager.location } else { return nil }
        }
    
    // MARK: - setupCurrentLocation() 
    
        private func setupCurrentLocation() {
            if let location = getUserLocation() {
                self.initialLocation = location
            }
        }
}