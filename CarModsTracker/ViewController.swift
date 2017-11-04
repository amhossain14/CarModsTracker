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
    
    private let addbutton: UIButton
    private let tittle: UILabel
    private let navbackground: UILabel
    init() {
    
        
    addbutton = UIButton(type: UIButtonType.custom) // addbutton
    tittle =  UILabel() // tittle label
    navbackground = UILabel ()
        
        //Here's Super Init
        super.init(nibName: nil, bundle: nil)
        let screenSize: CGSize = UIScreen.main.bounds.size
        let centerX: CGFloat = screenSize.width / 2
        let centerY: CGFloat = screenSize.height / 2
        
        // addbutton
        addbutton.frame = CGRect(x: centerX+165, y: centerY-350, width: 40, height: 40)
        addbutton.setImage(#imageLiteral(resourceName: "addbutton.png"), for: UIControlState.normal)
        addbutton.addTarget(self, action: #selector(ViewController.addbuttonbuttonPressed), for: UIControlEvents.touchUpInside)
      
        self.view.addSubview(addbutton)
       
       
        // tittle Label
        tittle.text = "Car Mods Tracker"
        tittle.textColor = UIColor.black
        tittle.textAlignment = NSTextAlignment.center
        tittle.frame = CGRect(x: centerX-210, y: centerY-350, width: 150, height: 40)
        self.view.addSubview(tittle)
       
        print("tittle labed Showed")
        
        // navbackground Label using for background
        navbackground.backgroundColor = UIColor.white
        navbackground.frame = CGRect(x: centerX-280, y: centerY-350, width: 500, height: 45)
        self.view.addSubview(navbackground)
        print("navbackground labed Showed")
        
        
         self.view.bringSubview(toFront: addbutton)/// bring to the front
         self.view.bringSubview(toFront: tittle)/// bring to the front
}
    

    
    // addbutton button Pressed method
    @objc func addbuttonbuttonPressed() {
        
        print("addbuttonbuttonPressed")
        let svc: AddCar = AddCar()
        svc.view.backgroundColor = UIColor.gray
        self.present(svc, animated: true) { () -> Void in
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

