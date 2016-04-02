//
//  ViewController.swift
//  PokemonRedbirdHacks
//
//  Created by Jesse Alltop on 4/1/16.
//  Copyright © 2016 Jesse Alltop. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var stepCounter:Int = 0



class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!

    
    
    var locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    //CLCircularRegion region = new CLCircularRegion(new CLLocationCoordinate2D(+37.29430502,-122.0942
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
 
        //CLCircularRegion.initCircularRegionWithCenter([0, 0], radius: 100, identifier: "whatever")
        
      //  CLCircularRegion.init(center: CLLocationCoordinate2D.init(latitude: 40.81150,longitude: 14.42753), radius: 10, identifier: "whatever")
    
        locationManager.startMonitoringForRegion(CLCircularRegion.init(center: CLLocationCoordinate2D.init(latitude: 28.04681,longitude: 86.92858), radius: 10, identifier: "everest"))
        
        
        locationManager.startMonitoringForRegion(CLCircularRegion.init(center: CLLocationCoordinate2D.init(latitude: 40.508644,longitude: -88.990932), radius: 10, identifier: "quad"))
        
        
        locationManager.startMonitoringForRegion(CLCircularRegion.init(center: CLLocationCoordinate2D.init(latitude: 40.81900,longitude: 14.42753), radius: 10, identifier: "pompeii"))

        
        locationManager.startMonitoringForRegion(CLCircularRegion.init(center: CLLocationCoordinate2D.init(latitude: 35.66336,longitude: 139.66833), radius: 10, identifier: "japan"))

    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        centerMapOnLocation(locationManager.location!)
    }
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,200, 200)
      
        mapView.setRegion(coordinateRegion, animated: true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func regionMonitoring(sender: AnyObject) {
        locationManager.requestAlwaysAuthorization()
        
//        let currRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 40.81150, longitude: 14.42753), radius: 10, identifier: "Home")
//        locationManager.startMonitoringForRegion(currRegion)
        
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion currRegion: CLRegion) {
//        NSLog("Entering region")
//        print(currRegion.identifier)

        
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion currRegion: CLRegion) {
        NSLog("Exit region")
        print(currRegion.identifier)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        NSLog("\(error)")
    }

    
    
    
    
    //encounter system
    
    
    
    
    
    
    
    
    
}




