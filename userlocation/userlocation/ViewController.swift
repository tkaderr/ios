//
//  ViewController.swift
//  userlocation
//
//  Created by Tahim Kader on 5/18/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var latlabel: UILabel!
    @IBOutlet weak var lonlabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
 
    @IBOutlet weak var addresslabel: UILabel!
    var stable: Bool?
    
    
    let locationmanager = CLLocationManager()

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if !stable! {
        let location = locations[0]
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.003, 0.003)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        stable = true
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = myLocation
        annotation.title = "My Location"
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(annotation)
        
    
        self.mapView.showsUserLocation = true
        
        CLGeocoder().reverseGeocodeLocation(location) {
            (placemark,error) in
            if error != nil{ print("Error")
            }
            else
            {
                if let place = placemark?[0]
                {
                    self.addresslabel.text = "\(place.subThoroughfare!) \(place.thoroughfare!)"
                }
                else{
                    self.addresslabel.text = "Unknown"
                }
            }
        }
      }
    }
    
    @IBAction func addpin(_ sender: UILongPressGestureRecognizer) {
        
        let mylocation = sender.location(in: self.mapView)
        let locCoord = self.mapView.convert(mylocation, toCoordinateFrom:self.mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = locCoord
        annotation.title = "Store"
        annotation.subtitle = "cool"
        latlabel.text = String(annotation.coordinate.latitude)
        lonlabel.text = String(annotation.coordinate.longitude)
        
        self.mapView.removeAnnotations(mapView.annotations)
        self.mapView.addAnnotation(annotation)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationmanager.delegate = self
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.startUpdatingLocation()
        stable = false
        
    }
}




