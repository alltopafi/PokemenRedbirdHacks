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
import CoreMotion


var stepCounter:Int = 0
var randomNumInt = arc4random()%20
var locationString:String = ""

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
       
        self.navigationController?.navigationBarHidden = true
        
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
        print(stepCounter)
        
        mapView.setRegion(coordinateRegion, animated: true)
        
        if(stepCounter == Int(randomNumInt)){
            print("yes things are going on")
            print(stepCounter)
            
            
            
            
            //encounter happens!
            

            let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            
            if let VC = storyBoard.instantiateViewControllerWithIdentifier("EncounterViewController") as? EncounterViewController {
                VC.locationString = locationString
                self.navigationController?.pushViewController(VC, animated: true)
            }

            
            
            
        }
        stepCounter += 1
        
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
          stepCounter=0
          randomNumInt = arc4random()%20
            print("step counter: ",stepCounter)
            print("random numnber: ",Int(randomNumInt))
        
        locationString = currRegion.identifier
        
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion currRegion: CLRegion) {
        NSLog("Exit region")
        print(currRegion.identifier)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        NSLog("\(error)")
    }

    
    
    
    
    //encounter system
    
    func encounterHappens(){
        
    }
    
    
}




