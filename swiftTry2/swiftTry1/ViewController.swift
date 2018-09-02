//
//  ViewController.swift
//  swiftTry1
//
//  Created by Anna Li on 9/2/18.
//  Copyright © 2018 Anna Li. All rights reserved.
//
import UIKit
import MessageUI
import MapKit
import GoogleMaps

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    
    //@IBOutlet weak var mapkitView: MKMapView!
    
    var locationManager = CLLocationManager()
    lazy var mapView = GMSMapView()
    
    override func loadView() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        mapView.isMyLocationEnabled = true
        
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last
        _ = CLLocationCoordinate2D(latitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude)
        
        let camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude,
                                              longitude: userLocation!.coordinate.longitude, zoom: 13.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        self.view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 40.7465036, longitude: -73.9868343)
        marker.title = "Catherine Zhou"
        marker.snippet = "5 min away"
        marker.map = mapView
        locationManager.stopUpdatingLocation()
    }
/*
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        mapkitView.delegate = self
        
        mapkitView.showsPointsOfInterest = true
        
        mapkitView.showsUserLocation = true
        
        
        
        locationManager.requestAlwaysAuthorization()
        
        locationManager.requestWhenInUseAuthorization()
        
        
        
        if CLLocationManager.locationServicesEnabled() {
            
            
            locationManager.delegate = self
            
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            locationManager.startUpdatingLocation()
            
        }
        
    }
    
    
    
    func locationManager(_ manager:CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.first!
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 500, 500)
        
        mapkitView.setRegion(coordinateRegion, animated: true)
        
        locationManager.stopUpdatingLocation()
        
    }
    
    */
    
    

}
