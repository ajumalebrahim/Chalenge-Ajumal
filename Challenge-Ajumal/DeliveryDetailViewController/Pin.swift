//
//  Pin.swift
//  Challenge-Ajumal
//
//  Created by Ajumal Ebrahim on 9/20/18.
//  Copyright © 2018 Ajumal Ebrahim. All rights reserved.
//

import Foundation

import MapKit

class Pin: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        
        super.init()
    }
}
