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
        
        for pin in pins{
            var location = CLLocationCoordinate2DMake(pin.latitude, pin.longitude)
            // Drop a pin
            var dropPin = MKPointAnnotation()
            dropPin.coordinate = location
            dropPin.title = pin.mapString
            dropPin.subtitle = pin.mediaURL?.absoluteString
            map.addAnnotation(dropPin)
        }
    }

    
    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!) {
        view.annotation.
    }
}