//
//  PinAnnotation.swift
//  On The Map
//
//  Created by Nicholas Busby on 4/29/15.
//  Copyright (c) 2015 Nicholas Busby. All rights reserved.
//

import Foundation
import MapKit

class PinAnnotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String
    var subtitle: String
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}