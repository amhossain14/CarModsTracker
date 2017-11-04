//
//  CarLabel.swift
//  CarModsTracker
//
//  Created by Shane Saunders on 11/4/17.
//  Copyright © 2017 Team 527. All rights reserved.
//
// Defines a #CarLabel object

import UIKit

class CarLabel: UIViewController {
    
    let thisCar: Car
    
    let carName: String
    
   // let nameLabel: UILabel
   // let carLabelPicture: UIImageView
    
    var screenSize: CGSize

    init(_ car: Car) {
        
        thisCar = car
        carName = thisCar.toString()
        
        screenSize = UIScreen.main.bounds.size
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
