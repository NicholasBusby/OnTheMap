//
//  MapViewController.swift
//  On The Map
//
//  Created by Nicholas Busby on 4/27/15.
//  Copyright (c) 2015 Nicholas Busby. All rights reserved.
//

import MapKit
import Foundation
import UIKit

class MapViewController: TabViewController, MKMapViewDelegate {
    
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        map.delegate = self
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if annotation is MKPointAnnotation {
            let pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myPin")
            
            pinAnnotationView.draggable = true
            pinAnnotationView.canShowCallout = true
            
            let infoButton = UIButton.buttonWithType(UIButtonType.InfoLight) as! UIButton
            infoButton.setImage(UIImage(named: "info"), forState: .Normal)
            
            pinAnnotationView.leftCalloutAccessoryView = infoButton
            return pinAnnotationView
        }
        
        return nil
    }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        goToURL(view.annotation.subtitle!)
    }
    
    override func usePins(){
        for pin in pins{
            var location = CLLocationCoordinate2DMake(pin.latitude, pin.longitude)
            // Drop a pindrop
            var dropPin = MKPointAnnotation()
            dropPin.coordinate = location
            dropPin.title = pin.mapString
            dropPin.subtitle = pin.mediaURL
            map.addAnnotation(dropPin)
        }
    }

}
