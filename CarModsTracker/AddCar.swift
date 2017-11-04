//
//  AddCar.swift
//  CarModsTracker
//
//  Created by Shane Saunders on 11/4/17.
//  Copyright © 2017 Team 527. All rights reserved.
//
// Modal View Controller
// This class handles the @AddCar view controller that is used to enter in a new car object by the user.

import UIKit

// this will be a different MVC  and it will have car name and models Years and others details
class AddCar: UIViewController {

    init() {
  

        //Here's Super Init
        super.init(nibName: nil, bundle: nil)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
