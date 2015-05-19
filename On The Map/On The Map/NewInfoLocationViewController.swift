//
//  NewInfoLocationViewController.swift
//  On The Map
//
//  Created by Nicholas Busby on 5/18/15.
//  Copyright (c) 2015 Nicholas Busby. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class NewInfoLocationViewController: UIViewController, UITextFieldDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var region: MKCoordinateRegion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationField.delegate = self
        map.delegate = self
    }
    
    
    @IBAction func findLocationClick(sender: AnyObject) {
        activityIndicator.hidden = false
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(locationField.text){ info, error in
            if let e = error {
                self.showBadLocation()
                self.activityIndicator.hidden = true
            } else {
                if let places = info as? [CLPlacemark]{
                    let coordinate = places[0].location.coordinate
                    let span = MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3)
                    self.region = MKCoordinateRegion(center: coordinate, span: span)
                    self.map.setRegion(self.region!, animated: true)
                    self.submitButton.enabled = true
                    
                    var dropPin = MKPointAnnotation()
                    dropPin.coordinate = coordinate
                    self.map.addAnnotation(dropPin)
                    
                    self.activityIndicator.hidden = true
                }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NewInfoPart2" {
            if var linkController = segue.destinationViewController as? NewInfoLinkViewController {
                linkController.region = region
                linkController.mapString = locationField.text
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func showBadLocation(){
        let alert = UIAlertView()
        alert.title = "Bad Location"
        alert.message = "Could not find that location"
        alert.addButtonWithTitle("OK")
        alert.show()
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if annotation is MKPointAnnotation {
            let pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myPin")
            
            pinAnnotationView.draggable = false
            pinAnnotationView.canShowCallout = false
            
            return pinAnnotationView
        }
        
        return nil
    }
}