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
    
    public var engine: String
    public var transmission: String
    public var plate: String
    public var drivetrain: String
    public var vin: String
    public var coverPhoto: UIImageView

    // Method @init() creates a car object with the parameters year, make, and model. Cars can be added to @linkedList
    init(y: String, m: String, mo: String,  eng: String,  trans: String,  plt: String, dt: String, vn: String) {
        
        year = y
        make = m
        model = mo
        engine = eng
        transmission = trans
        plate = plt
        drivetrain = dt
        vin = vn
        coverPhoto = UIImageView()
        super.init()
        
    }
    
    // Returns Year, Make, and Model in a string
    public func toString() -> String {
        
        let result: String = (year + " " + make + " " + model)
        
        return result
        
    }
   
    
}
