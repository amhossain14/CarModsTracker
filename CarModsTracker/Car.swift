//
//  Car.swift
//  CarModsTracker
//
//  Created by Shane Saunders on 11/4/17.
//  Copyright © 2017 Team 527. All rights reserved.
//
// Describes a car object

import UIKit

class Car: NSObject {
    
    public var year: String
    public var make: String
    public var model: String

    init(_ y: String, _ m: String, _ mo: String) {
        
        year = y
        make = m
        model = mo
        
    }
    
    public func toString() -> String {
        
        let result: String = (year + " " + make + " " + model)
        
        return result
        
    }
    
}
