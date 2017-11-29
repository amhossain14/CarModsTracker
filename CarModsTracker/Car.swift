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
    public let coverPhoto: UIImageView

    // Method @init() creates a car object with the parameters year, make, and model. Cars can be added to @linkedList
    init(_ y: String, _ m: String, _ mo: String, _ eng: String, _ trans: String, _ plt: String) {
        
        year = y
        make = m
        model = mo
        engine = eng
        transmission = trans
        plate = plt
        coverPhoto = UIImageView()
        super.init()
        
    }
    
    // Returns Year, Make, and Model in a string
    public func toString() -> String {
        
        let result: String = (year + " " + make + " " + model)
        
        return result
        
    }
   
    
}
