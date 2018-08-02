//
//  ViewController.swift
//  mapView
//
//  Created by Mohammed Abalkhail on 8/1/18.
//  Copyright © 2018 Mohammed Abalkhail. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate {
    @IBOutlet weak var map: MKMapView!
    
    let locationManager = CLLocationManager()
    var lat:Double = 0.0
    var long:Double = 0.0
    let span = MKCoordinateSpanMake(0.2,0.2)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        

    }
    
    // getting location attribute
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        lat = location.coordinate.latitude
        long = location.coordinate.longitude
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        map.setRegion(region, animated: true)
        self.map.showsUserLocation = true
        let annotation = MKPointAnnotation()
        let annotation2 = MKPointAnnotation()
        let annotation3 = MKPointAnnotation()
        let annotation4 = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: lat+0.001, longitude: long+0.001)
        annotation2.coordinate = CLLocationCoordinate2D(latitude: lat-0.001, longitude: long-0.001)
        annotation3.coordinate = CLLocationCoordinate2D(latitude: lat+0.002, longitude: long+0.002)
        annotation4.coordinate = CLLocationCoordinate2D(latitude: lat-0.002, longitude: long-0.002)
        
      // add location on the map 
        map.addAnnotation(annotation)
        map.addAnnotation(annotation2)
        map.addAnnotation(annotation3)
        map.addAnnotation(annotation4)
        
    }


}

