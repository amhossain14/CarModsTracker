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

class AddCarViewController: UIViewController {

//        private let addbutton: UIButton
//    private var carAddTable: UITableView
    private var editButton: UIButton

    init() {
<<<<<<< HEAD:CarModsTracker/AddCar.swift
        
        let screenSize: CGSize = UIScreen.main.bounds.size
        editButton = UIButton(type: UIButtonType.custom)

        
//        carAddTable = UITableView(frame: CGRect(x: (screenSize.width, y: screenSize.height, width:300, height: 300),style:UITableViewStyle.plain))

        //Here's Super Init
        super.init(nibName: nil, bundle: nil)
        
//        carAddTable.dataSource = self
//        carAddTable.delegate = self
        
        
        self.view.backgroundColor = UIColor(red: 0.83984375, green: 0.85546875, blue: 0.84375, alpha: 1.0)
//        self.view.addSubview(carAddTable)
        
        editButton.frame = CGRect(x: UIScreen.main.bounds.width-90, y: 20, width: 90, height: 90)
        editButton.setTitle("Edit", for: UIControlState.normal)
//        editButton.addTarget(self, action: #selector(AddCar.editTable), for: UIControlEvents.touchUpInside)
        self.view.addSubview(editButton)
        
        
        
        
    }
    
    // func for Edit Table
//    @objc func editTable() {
//        carAddTable.setEditing(!carAddTable.isEditing, animated: true)
//    }
    
=======
  
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor.gray
    }
    
    
    
    

>>>>>>> b36bf902f8f7240d29fdcca83c01fe0934308a2d:CarModsTracker/AddCarViewController.swift
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
