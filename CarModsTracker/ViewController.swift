//
//  ViewController.swift
//  CarModsTracker
//
//  Created by Shane Saunders on 10/5/17.
//  Copyright © 2017 Team 527. All rights reserved.
//
// This is the main, default view controller.

import UIKit

class ViewController: UIViewController {
    
    private let addButton: UIButton
    private let appName: UILabel
    private let navBackground: UILabel
    init() {
    
        
    addButton = UIButton(type: UIButtonType.custom) // addbutton
    appName =  UILabel() // tittle label
    navBackground = UILabel ()
        
        //Here's Super Init
        super.init(nibName: nil, bundle: nil)
        let screenSize: CGSize = UIScreen.main.bounds.size
        let centerX: CGFloat = screenSize.width / 2
        let centerY: CGFloat = screenSize.height / 2
        let topOffset: CGFloat = screenSize.height * 0.1
        
        // addbutton
        addButton.frame = CGRect(x: centerX+165, y: centerY-350, width: 40, height: 40)
        addButton.setImage(#imageLiteral(resourceName: "addbutton.png"), for: UIControlState.normal)
        addButton.addTarget(self, action: #selector(ViewController.addButtonPressed), for: UIControlEvents.touchUpInside)
      
        self.view.addSubview(addButton)
       
       
        // title Label
        appName.text = "Car Mods Tracker"
        appName.textColor = UIColor.black
        appName.textAlignment = NSTextAlignment.center
        appName.frame = CGRect(x: centerX-210, y: centerY-350, width: 150, height: 40)
        self.view.addSubview(appName)
       
        print("title label shown")
        
<<<<<<< HEAD
        // navbackground Label using for background
        navbackground.backgroundColor = UIColor.white
        navbackground.frame = CGRect(x: centerX-280, y: centerY-350, width: 500, height: topOffset)
        self.view.addSubview(navbackground)
=======
        // navBackground Label used for background
        navBackground.backgroundColor = UIColor.white
        navBackground.frame = CGRect(x: centerX-280, y: centerY-350, width: 500, height: 45)
        self.view.addSubview(navBackground)
>>>>>>> b36bf902f8f7240d29fdcca83c01fe0934308a2d
        print("navbackground labed Showed")
        
        
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

