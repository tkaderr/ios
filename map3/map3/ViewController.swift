//
//  ViewController.swift
//  map3
//
//  Created by Tahim Kader on 5/18/17.
//  Copyright © 2017 Tahim Kader. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    var locationmanager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
                let location = locations[0]
                let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
                let span:MKCoordinateSpan = MKCoordinateSpanMake(0.003, 0.003)
                let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
                mapView.setRegion(region, animated: true)
        
                let annotation = MKPointAnnotation()
                annotation.coordinate = myLocation
                annotation.title = "title"
                mapView.removeAnnotations(mapView.annotations)
                mapView.addAnnotation(annotation)
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView! {
        
        //se l'annotation è la posizione dell'Utente allora esci dalla funzione e mostra il punto blu
        if annotation is MKUserLocation {
            return nil
        }
        
        //creo un id da associare ad ogni annotationView
        let reuseId = "punto"
        //se esistono troppi punti nella mappa, prende quello non visto e lo riutilizza nella porzione di mappa vista
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        //se non è stata ancora creata un'AnnotationView la crea
        if pinView == nil {
            //creo un pin di tipo MKAnnotationView che rappresenta l'oggetto reale da inserire in mappa
            pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            //cambio l'immagine standard del point annotation con una creata da me
//            pinView!.image = UIImage(named: "pin.png")
            //sblocco la possibilità di cliccarlo per vedere i dettagli
            pinView!.canShowCallout = true
        }
        else {
            //se esiste lo modifico con il nuovo point richiesto
            pinView!.annotation = annotation
        }
        //restituisce un pointAnnotation nuovo o modificato
        return pinView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        locationmanager.delegate = self
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

