//
//  ViewController.swift
//  MapView
//
//  Created by Mauricio Luiz Sobrinho on 10/04/17.
//  Copyright © 2017 Mauricio Luiz Sobrinho. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Location Delegate Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        //_ = MKCoordinateRegion(center: center, span: <#T##MKCoordinateSpan#>)
        //self.mapView.setRegion(<#T##region: MKCoordinateRegion##MKCoordinateRegion#>, animated: true)
        self.locationManager.stopUpdatingLocation()
    }

}

