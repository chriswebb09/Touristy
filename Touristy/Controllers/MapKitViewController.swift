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
    
    var trinityChurch = HistoricalLocation()
    var saintPauls = HistoricalLocation()
    var federalHall = HistoricalLocation()
    var frauncesTavern = HistoricalLocation()
    var bowlingGreen = HistoricalLocation()
    var historicalLocal: [String: HistoricalLocation]?
    
    let mapView: MKMapView! = MKMapView()
    let initialLocation = CLLocation(latitude: 34.4248, longitude: -118.5971)
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        self.mapView.delegate = self
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
        
        self.historicalLocal = ["Trinity" : self.trinityChurch,
                                "St Pauls" : self.saintPauls,
                                "Federal Hall" : self.federalHall,
                                "Fraunces Tavern" : self.frauncesTavern,
                                "Bowling Green" : self.bowlingGreen]
        self.mapView.frame = view.frame
        self.view.addSubview(mapView)
        self.centerMapOnLocation(self.initialLocation)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0,
                                                                  regionRadius * 2.0)
        self.mapView.setRegion(coordinateRegion,
                               animated: true)
    }
    
//    func centerMapOnLocation(location: CLLocation) {
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, self.regionRadius * 2.0, self.regionRadius * 2.0)
//        self.mapView.setRegion(coordinateRegion, animated: true)
//    }
}
//func loadOverlayForRegionWithLatitude(latitude: Double, andLongitude longitude: Double) {
//    
//    //1
//    let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//    //2
//    circle = MKCircle(centerCoordinate: coordinates, radius: 200000)
//    //3
//    self.mapView.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7)), animated: true)
//    //4
//    self.mapView.addOverlay(circle)
//}

//
//
//func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
//    
//    let circleRenderer = MKCircleRenderer(overlay: overlay)
//    circleRenderer.fillColor = UIColor.blueColor().colorWithAlphaComponent(0.1)
//    circleRenderer.strokeColor = UIColor.blueColor()
//    circleRenderer.lineWidth = 1
//    return circleRenderer
//}


extension MapViewController: CLLocationManagerDelegate {
    func getUserLocation() -> CLLocation? {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        let userAuthorized = (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse || CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedAlways)
        if userAuthorized { return locationManager.location } else { return nil }
    }
    
    private func setupCurrentLocation() {
        if let location = getUserLocation() {
            userStartLocation = location 
        }
    }
}