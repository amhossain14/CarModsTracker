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
    private let amirsCar: Car
    
    private let car1: UIImageView
    private let car2: UIImageView
    
    private let mainScrollView: UIScrollView
    
   // private let navConstraints: CGRect
    
    init() {
        
        shanesCar = Car("2005", "Acura", "TL")
        amirsCar = Car("2006", "Nissan", "Maxima")
        
        car1 = UIImageView()
        car2 = UIImageView()
        mainScrollView = UIScrollView()
        
        car1.image = UIImage(named: "2005acuratl")
        car2.image = UIImage(named: "2006nissanmaxima")
        
        garage = linkedList()
        
        garage.append(value: amirsCar)
        garage.append(value: shanesCar)
        
        addButton = UIButton(type: UIButtonType.custom) // addbutton
        appName =  UILabel() // tittle label
        navBackground = UILabel ()
        
        //Here's Super Init
        super.init(nibName: nil, bundle: nil)
        
        //offsets and constraints
        let screenSize: CGSize = UIScreen.main.bounds.size
        let centerX: CGFloat = screenSize.width / 2
        let centerY: CGFloat = screenSize.height / 2
        let topOffset: CGFloat = screenSize.height * 0.10
        let topLeftTitleOffset: CGFloat = topOffset * 0.1
        let carConstraints = CGRect(x: 0, y: topOffset, width: screenSize.width, height: screenSize.height-topOffset)
        let carLabelConstraints = CGSize(width: screenSize.width, height: screenSize.width * (9/16))
       
        //scroll view
        mainScrollView.isScrollEnabled = true
        mainScrollView.bounces = true
        mainScrollView.showsVerticalScrollIndicator = true
        mainScrollView.frame = carConstraints
        mainScrollView.contentSize = CGSize(width: screenSize.width, height: screenSize.height * 2)
        mainScrollView.backgroundColor = UIColor.blue
        self.view.addSubview(mainScrollView)
        
        // addbutton
        addButton.frame = CGRect(x: screenSize.width - (topOffset * 0.5) - 5, y: topOffset * 0.4, width: topOffset * 0.5, height: topOffset * 0.5)
        addButton.setImage(#imageLiteral(resourceName: "addbutton.png"), for: UIControlState.normal)
        addButton.addTarget(self, action: #selector(ViewController.addButtonPressed), for: UIControlEvents.touchUpInside)
      
        self.view.addSubview(addButton)
       
        //
       
        // title Label
        appName.text = "Car Mods Tracker"
        appName.textColor = UIColor.black
        appName.textAlignment = NSTextAlignment.left
        appName.frame = CGRect(x: topLeftTitleOffset, y: topLeftTitleOffset, width: centerX, height: topOffset)
        self.view.addSubview(appName)
       
        print("title label shown")
        
        // navbackground Label using for background
        navBackground.backgroundColor = UIColor.white
        navBackground.frame = carConstraints
        //self.view.addSubview(navBackground)
        
        //first car label
        car1.frame = CGRect(x: (carConstraints.width * 0.03), y: (carConstraints.width * 0.03), width: carLabelConstraints.width * 0.94, height: carLabelConstraints.height * 0.94)
        mainScrollView.addSubview(car1)

         self.view.bringSubview(toFront: addButton)/// bring to the front
         self.view.bringSubview(toFront: appName)/// bring to the front
}

    // addbutton button Pressed method
    @objc func addButtonPressed() {
        
        print("addButtonPressed")
        let acvc: AddCarViewController = AddCarViewController()
        self.present(acvc, animated: true) { () -> Void in
            NSLog("AddCarViewController")
        }
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


//<<<<<<< HEAD
//=======
//
//
//
//    /*
// let carA: Car
// let carB: Car
//
// let carList: linkedList<Car>
//
// var testString: String
//
// init() {
// carA = Car("2005", "Acura", "TL")
// carB = Car("2007", "Nissan", "Maxima")
// carList = linkedList()
//
// carList.append(value: carA)
// carList.append(value: carB)
//
// testString = carList.nodeAt(index: 1).value.toString()
// super.init(nibName: nil, bundle: nil)
// print(testString)
//
// for node in carList {
//
// testString = node.value.toString()
// print(testString)
// */
// }
//
//>>>>>>> c53520b55c329ca5fc961d352c5d706918806be5
//}

