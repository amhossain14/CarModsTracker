//
//  CarView.swift
//  CarModsTracker
//
//  Created by Shane Saunders on 11/4/17.
//  Copyright © 2017 Team 527. All rights reserved.
//
// This handles the Modal View Controller for when a user opens up a car (from a car label)

import UIKit

class CarView: UIViewController {
    
    private let currentCar: Car
    private let currentCarName: String

    init(CarToBeViewed: Car) {
        
        currentCar = CarToBeViewed
        currentCarName = currentCar.toString()
        
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
