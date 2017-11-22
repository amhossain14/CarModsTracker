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

<<<<<<< HEAD
class AddCarViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate {
    //Label
    let labelYear : UILabel
    let labelModel : UILabel
    let labelMake : UILabel
    //TextField
    let textYear: UITextField
    let textModel:UITextField
    let textMake:UITextField
    
    init() {

        // Label
         labelYear = UILabel()
         labelModel = UILabel()
         labelMake = UILabel()
        
        // Text
        textYear = UITextField()
        textModel = UITextField()
        textMake = UITextField()
=======
class AddCarViewController: UIViewController {

//    private let addbutton: UIButton
//    private var carAddTable: UITableView
    private var editButton: UIButton
    
    private let carCollection: linkedList<Car>

    init() {
        carCollection = linkedList()
>>>>>>> 7c3955906f87b9e68a4fc20bd77c4412c91ecde3
        
        let screenSize: CGSize = UIScreen.main.bounds.size
//        let centerX: CGFloat = screenSize.width / 2
//        let centerY: CGFloat = screenSize.height / 2
        
        // This height and width are for Textbox and Label height is .05% of the screens and Width is 0.15%
        let labelHeight: CGFloat = screenSize.height * 0.05
        let labelWidth: CGFloat = screenSize.width * 1
        
        // For Center X and Y with 10%
        let centerXWith10: CGFloat = (screenSize.width / 2)*0.01
        let centerYWith10: CGFloat = (screenSize.height / 2)*0.01
        
        
        //Here's Super Init
        super.init(nibName: nil, bundle: nil)
        
        //this is for scrollView
        let addCarScrollView: UIScrollView = UIScrollView() // this make sure its full screen
        addCarScrollView.delegate = self
        addCarScrollView.showsHorizontalScrollIndicator = false
        addCarScrollView.showsVerticalScrollIndicator = true
        addCarScrollView.contentSize = CGSize(width: screenSize.width, height: screenSize.height*1.5)
        addCarScrollView.backgroundColor = UIColor.red
        
       // Label for Year
        labelYear.text = "Year"
        labelYear.backgroundColor = UIColor.white
        labelYear.textColor = UIColor.black
        labelYear.textAlignment = NSTextAlignment.center
        labelYear.frame = CGRect(x: centerXWith10, y: (centerYWith10*5), width: labelWidth, height: labelHeight)
        addCarScrollView.addSubview(labelYear)
        
        // TEXTFIELD for Year
        textYear.frame = CGRect(x: centerXWith10, y: (centerYWith10*15), width: labelWidth, height: labelHeight)
        textYear.textColor = UIColor.black
        textYear.font = UIFont.systemFont(ofSize: 17.0)
        textYear.textAlignment = NSTextAlignment.center
        textYear.placeholder = " Enter Year "
        textYear.backgroundColor = UIColor.white
        textYear.borderStyle = UITextBorderStyle.bezel
        textYear.keyboardType = UIKeyboardType.default
        textYear.returnKeyType = UIReturnKeyType.done
        textYear.clearButtonMode = UITextFieldViewMode.always
        textYear.delegate = self
        addCarScrollView.addSubview(textYear)
        
        // Label for MODEL
        labelModel.text = "Model"
        labelModel.backgroundColor = UIColor.white
        labelModel.textColor = UIColor.black
        labelModel.textAlignment = NSTextAlignment.center
        labelModel.frame = CGRect(x: centerXWith10, y: (centerYWith10*25), width: labelWidth, height: labelHeight)
        addCarScrollView.addSubview(labelModel)
        
        // TEXTFIELD for MODEL
        textModel.frame = CGRect(x: centerXWith10, y: (centerYWith10*35), width: labelWidth, height: labelHeight)
        textModel.textColor = UIColor.black
        textModel.font = UIFont.systemFont(ofSize: 17.0)
        textModel.textAlignment = NSTextAlignment.center
        textModel.placeholder = " Enter Model "
        textModel.backgroundColor = UIColor.white
        textModel.borderStyle = UITextBorderStyle.bezel
        textModel.keyboardType = UIKeyboardType.default
        textModel.returnKeyType = UIReturnKeyType.done
        textModel.clearButtonMode = UITextFieldViewMode.always
        textModel.delegate = self
        addCarScrollView.addSubview(textModel)
        
        // Label for MAKE
        labelMake.text = "Make"
        labelMake.backgroundColor = UIColor.white
        labelMake.textColor = UIColor.black
        labelMake.textAlignment = NSTextAlignment.center
        labelMake.frame = CGRect(x: centerXWith10, y: (centerYWith10*45), width: labelWidth, height: labelHeight)
        addCarScrollView.addSubview(labelMake)

        // TEXTFIELD for MAKE
        textMake.frame = CGRect(x: centerXWith10, y: (centerYWith10*55), width: labelWidth, height: labelHeight)
        textMake.textColor = UIColor.black
        textMake.font = UIFont.systemFont(ofSize: 17.0)
        textMake.textAlignment = NSTextAlignment.center
        textMake.placeholder = " Enter Make "
        textMake.backgroundColor = UIColor.white
        textMake.borderStyle = UITextBorderStyle.bezel
        textMake.keyboardType = UIKeyboardType.default
        textMake.returnKeyType = UIReturnKeyType.done
        textMake.clearButtonMode = UITextFieldViewMode.always
        textMake.delegate = self
        addCarScrollView.addSubview(textMake)
        
        
       
        
        
        
        
        self.view = addCarScrollView
//        self.view.backgroundColor = UIColor(red: 0.83984375, green: 0.85546875, blue: 0.84375, alpha: 1.0)
    }
    
<<<<<<< HEAD
    
=======
    // func for Edit Table
//    @objc func editTable() {
//        carAddTable.setEditing(!carAddTable.isEditing, animated: true)
//    }
    
    // Adds entered information by user into the #carCollection
    // Step 1: Pull in user information from 'this' to create a new Car object
    // Step 2: Add car to #carCollection
    public func addCarToCollection() {
        var newCar: Car = Car("2005", "Acura", "TL") //temporary
        
        //code to get information from user
        
        carCollection.append(value: newCar)
        
    }
>>>>>>> 7c3955906f87b9e68a4fc20bd77c4412c91ecde3

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
