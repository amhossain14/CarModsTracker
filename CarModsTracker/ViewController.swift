//
//  ViewController.swift
//  CarModsTracker
//
//  Created by Shane Saunders on 10/5/17.
//  Copyright © 2017 Team 527. All rights reserved.
//
// This is the main, default view controller.

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    private let addButton: UIButton
    private let appName: UILabel
    private let navBackground: UILabel
    
    private let garage: linkedList<Car>
    private let shanesCar: Car
    //private var tempCar: Car
    // private let amirsCar: Car
    
    //embedded car
    private let car1: UIImageView
    
    //views
    private let carView: CarView
    private let mainScrollView: UIScrollView
    
    let screenSize: CGSize
    let centerX: CGFloat
    let centerY: CGFloat
    let topOffset: CGFloat
    let topLeftTitleOffset: CGFloat
    let carConstraints: CGRect
    let carLabelConstraints: CGSize
    
    
    init() {
        car1 = UIImageView()
        car1.image = UIImage(named: "2005acuratl")
        

        shanesCar = Car(y: "2005", m: "ACURA", mo: "TL", eng: "3.2L V6 SOHC i-VTEC", trans: "6-speed Manual", plt: "123456")
        //amirsCar = Car("2006", "Nissan", "Maxima")

//        shanesCar = Car("2005", "ACURA", "TL", "3.2L V6 SOHC i-VTEC", "6-speed Manual", "123456")
        //tempCar = Car("2005", "ACURA", "TL", "3.2L V6 SOHC i-VTEC", "6-speed Manual", "123456")
        shanesCar.coverPhoto = car1

        
        mainScrollView = UIScrollView()
        garage = linkedList()
        garage.append(value: shanesCar)
        
        carView = CarView(CarToBeViewed: shanesCar, theGarage: garage)
        
        //Buttons and Labels
        addButton = UIButton(type: UIButtonType.custom) // addbutton
        appName =  UILabel() // tittle label
        navBackground = UILabel ()
        
        //offsets and constraints
        screenSize = UIScreen.main.bounds.size
        centerX = screenSize.width / 2
        centerY = screenSize.height / 2
        topOffset = screenSize.height * 0.10
        topLeftTitleOffset = topOffset * 0.1
        carConstraints = CGRect(x: 0, y: topOffset, width: screenSize.width, height: screenSize.height-topOffset)
        carLabelConstraints = CGSize(width: screenSize.width, height: screenSize.width * (9/16))
        
        //Here's Super Init
        super.init(nibName: nil, bundle: nil)
        
        
        
        //scroll view
        mainScrollView.isScrollEnabled = true
        mainScrollView.bounces = true
        mainScrollView.showsVerticalScrollIndicator = true
        mainScrollView.frame = carConstraints
        mainScrollView.contentSize = CGSize(width: screenSize.width, height: screenSize.height * 2)
        mainScrollView.backgroundColor = UIColor.lightGray
        self.view.addSubview(mainScrollView)
        
        // addbutton
        addButton.frame = CGRect(x: screenSize.width - (topOffset * 0.5) - 5, y: topOffset * 0.4, width: topOffset * 0.5, height: topOffset * 0.5)
        addButton.setImage(#imageLiteral(resourceName: "addbutton.png"), for: UIControlState.normal)
        addButton.addTarget(self, action: #selector(ViewController.addButtonPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(addButton)
        
        
        
        // title Label
        appName.text = "Car Mods Tracker"
        appName.font = UIFont.boldSystemFont(ofSize: 20.0)
        appName.textColor = UIColor.black
        appName.textAlignment = NSTextAlignment.left
        appName.frame = CGRect(x: topLeftTitleOffset, y: topLeftTitleOffset, width: centerX, height: topOffset)
        self.view.addSubview(appName)
        
        print("title label shown")
        
        
        //first car label
        car1.frame = CGRect(x: (carConstraints.width * 0.03), y: (carConstraints.width * 0.03), width: carLabelConstraints.width * 0.94, height: carLabelConstraints.height * 0.94)
        car1.isUserInteractionEnabled = true
        car1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTapOnCar(_:))))
        //car1.(self, action: #selector(ViewController.carPressed), for: UIControlEvents.touchUpInside)
        mainScrollView.addSubview(car1)
        
        
        self.view.bringSubview(toFront: addButton)/// bring to the front
        self.view.bringSubview(toFront: appName)/// bring to the front
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // addbutton button Pressed method
    @objc func addButtonPressed() {
        
        print("addButtonPressed")
        let acvc: AddCarViewController = AddCarViewController(theGarage: garage)
        self.present(acvc, animated: true) { () -> Void in
            NSLog("AddCarViewController")
        }
    }
    
    @objc func handleTapOnCar(_ recognizer: UITapGestureRecognizer) {
    
        let cv: CarView
        cv = CarView(CarToBeViewed: shanesCar, theGarage: garage)
        
        self.present(cv, animated: true) { () -> Void in
            NSLog("CarViewController")
        }
        
    }
    
    private func refreshScrollView() {
        
        self.mainScrollView.removeFromSuperview()
        
        let positionIndex: CGFloat = 1.0
        
        for car in garage {
            let tempCar: UIImageView = car.value.coverPhoto
            let gesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOnCar(_:)))
            
            tempCar.frame = CGRect(x: (self.carConstraints.width * 0.03), y: (carConstraints.width * 0.03) + ((carLabelConstraints.height * 0.94)*positionIndex), width: carLabelConstraints.width * 0.94, height: carLabelConstraints.height * 0.94)
            tempCar.isUserInteractionEnabled = true
            tempCar.addGestureRecognizer(gesture)
        }
        
        self.view.addSubview(mainScrollView)
        
    }
    
}
