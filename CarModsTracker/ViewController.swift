//
//  ViewController.swift
//  CarModsTracker
//
//  Created by Shane Saunders on 10/5/17.
//  Copyright © 2017 Team 527. All rights reserved.
//
// This is the main, default view controller.

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    private var carsIndex: Int
    
    private let addButton: UIButton
    private let refreshButton: UIButton
    private let appName: UILabel
    private let navBackground: UILabel
    
    private var garage: linkedList<Car>
    private let shanesCar: Car
    //private var tempCar: Car
    //private let amirsCar: Car
    
    //embedded car
    private let car1: UIImageView
    
    //views
    private let carView: CarView
    private let mainScrollView: UIScrollView
    private var acvc: AddCarViewController
    
    //let screenSize: CGSize
    //let centerX: CGFloat
    //let centerY: CGFloat
    let topOffset: CGFloat
    let topLeftTitleOffset: CGFloat
    let carConstraints: CGRect
    let carLabelConstraints: CGSize
    //*********************************************
    
    
    // this is test
    var carPicture: UIImageView
    //let currentGarage: linkedList<Car>
    
    //Label
    let labelYear: UILabel
    let labelModel : UILabel
    let labelMake : UILabel
    let labelVin: UILabel
    let labelTransmission : UILabel
    let labelPlate : UILabel
    let labelengine : UILabel
    let labelDrivetrain : UILabel
    
    //TextField
    let textYear: UITextField
    let textModel:UITextField
    let textMake:UITextField
    let textVin: UITextField
    let textTransmission: UITextField
    let textPlate: UITextField
    let textengine: UITextField
    let textDrivetrain: UITextField
    
    // Button
    let doneButton: UIButton
    let cancelButton: UIButton
    let addPicture: UIButton
    
    let carScrollView: UIView
    
    init() {
        carsIndex = 0
        
        car1 = UIImageView()
        car1.image = UIImage(named: "2005acuratl")
        
        shanesCar = Car(y: "2005", m: "ACURA", mo: "TL", eng: "3.2L V6 SOHC i-VTEC", trans: "6-speed Manual", plt: "123456")
        //tempCar = Car("2005", "ACURA", "TL", "3.2L V6 SOHC i-VTEC", "6-speed Manual", "123456")
        shanesCar.coverPhoto = car1
        
        mainScrollView = UIScrollView()
        garage = linkedList()
        garage.append(value: shanesCar)
        
        carView = CarView(CarToBeViewed: shanesCar)
        
        //Buttons and Labels
        addButton = UIButton(type: UIButtonType.custom) // addbutton
        refreshButton = UIButton(type: UIButtonType.custom)
        appName =  UILabel() // tittle label
        navBackground = UILabel ()
        
        //offsets and constraints
        //screenSize = UIScreen.main.bounds.size
        //centerX = screenSize.width / 2
        //centerY = screenSize.height / 2
        topOffset = UIScreen.main.bounds.size.height * 0.10
        topLeftTitleOffset = topOffset * 0.1
        carConstraints = CGRect(x: 0, y: topOffset, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-topOffset)
        carLabelConstraints = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width * (9/16))
        
        acvc = AddCarViewController(theGarage: garage)
        //******************************************************
        
        // this is test
        carPicture = UIImageView()
        
        // Labels
        labelYear = UILabel()
        labelModel = UILabel()
        labelMake = UILabel()
        labelVin = UILabel()
        labelTransmission = UILabel()
        labelPlate = UILabel()
        labelengine = UILabel()
        labelDrivetrain = UILabel()
        
        // Texts
        textYear = UITextField()
        textModel = UITextField()
        textMake = UITextField()
        textVin = UITextField()
        textTransmission = UITextField()
        textPlate = UITextField()
        textengine = UITextField()
        textDrivetrain = UITextField()
        
        // Buttons
        doneButton = UIButton(type: UIButtonType.custom)
        cancelButton = UIButton(type: UIButtonType.custom)
        addPicture  = UIButton(type: UIButtonType.custom)
        
        let screenSize: CGSize = UIScreen.main.bounds.size
        let centerX: CGFloat = screenSize.width / 2
        let centerY: CGFloat = screenSize.height / 2
        
        // This height and width are for Textbox and Label height is .05% of the screens
        let labelHeight: CGFloat = screenSize.height * 0.05
        //        let labelWidth: CGFloat = screenSize.width * 1
        
        // For Center X and Y with 10%
        let centerXWith10: CGFloat = centerX * 0.01
        let centerYWith10: CGFloat = centerY * 0.01
        
        // for buttons position
        let bottomOffset: CGFloat = screenSize.height * 0.10
        
        carScrollView = UIView() // this make sure its full screen
        
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
        
        //refresh
        refreshButton.frame = CGRect(x: screenSize.width - ((topOffset * 0.5) - 5)*3, y: topOffset * 0.4, width: topOffset * 0.5, height: topOffset * 0.5)
        refreshButton.setImage(#imageLiteral(resourceName: "refresh.png"), for: UIControlState.normal)
        refreshButton.addTarget(self, action: #selector(ViewController.refreshButtonPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(refreshButton)
        
        
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
        
        
        //this is for scrollView
        //addCarScrollView = UIScrollView() // this make sure its full screen
//        addCarScrollView.delegate = self
//        addCarScrollView.showsHorizontalScrollIndicator = false
//        addCarScrollView.showsVerticalScrollIndicator = true
//        addCarScrollView.contentSize = CGSize(width: screenSize.width, height: screenSize.height*1.0001)
        carScrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        carScrollView.backgroundColor = UIColor.red
        
        // Label for Year
        labelYear.text = "Year"
        labelYear.backgroundColor = UIColor.white
        labelYear.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelYear.textColor = UIColor.black
        labelYear.textAlignment = NSTextAlignment.center
        labelYear.frame = CGRect(x: centerXWith10, y: (centerYWith10*5), width: centerX * 2, height: labelHeight)
        carScrollView.addSubview(labelYear)
        
        // TEXTFIELD for Year
        textYear.frame = CGRect(x: centerXWith10, y: (centerYWith10*15), width: centerX * 2, height: labelHeight)
        textYear.textColor = UIColor.black
        textYear.font = UIFont.systemFont(ofSize: 17.0)
        textYear.textAlignment = NSTextAlignment.center
        textYear.placeholder = "Enter Year"
        textYear.backgroundColor = UIColor.white
        textYear.borderStyle = UITextBorderStyle.bezel
        textYear.keyboardType = UIKeyboardType.default
        textYear.returnKeyType = UIReturnKeyType.done
        textYear.clearButtonMode = UITextFieldViewMode.always
        textYear.delegate = self
        carScrollView.addSubview(textYear)
        
        // Label for MODEL
        labelModel.text = "Model"
        labelModel.backgroundColor = UIColor.white
        labelModel.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelModel.textColor = UIColor.black
        labelModel.textAlignment = NSTextAlignment.center
        labelModel.frame = CGRect(x: centerXWith10, y: (centerYWith10*25), width: centerX * 2, height: labelHeight)
        carScrollView.addSubview(labelModel)
        
        // TEXTFIELD for MODEL
        textModel.frame = CGRect(x: centerXWith10, y: (centerYWith10*35), width: centerX * 2, height: labelHeight)
        textModel.textColor = UIColor.black
        textModel.font = UIFont.systemFont(ofSize: 17.0)
        textModel.textAlignment = NSTextAlignment.center
        textModel.placeholder = "Enter Model"
        textModel.backgroundColor = UIColor.white
        textModel.borderStyle = UITextBorderStyle.bezel
        textModel.keyboardType = UIKeyboardType.default
        textModel.returnKeyType = UIReturnKeyType.done
        textModel.clearButtonMode = UITextFieldViewMode.always
        textModel.delegate = self
        carScrollView.addSubview(textModel)
        
        // Label for MAKE
        labelMake.text = "Make"
        labelMake.backgroundColor = UIColor.white
        labelMake.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelMake.textColor = UIColor.black
        labelMake.textAlignment = NSTextAlignment.center
        labelMake.frame = CGRect(x: centerXWith10, y: (centerYWith10*45), width: centerX * 2, height: labelHeight)
        carScrollView.addSubview(labelMake)
        
        // TEXTFIELD for MAKE
        textMake.frame = CGRect(x: centerXWith10, y: (centerYWith10*55), width: centerX * 2, height: labelHeight)
        textMake.textColor = UIColor.black
        textMake.font = UIFont.systemFont(ofSize: 17.0)
        textMake.textAlignment = NSTextAlignment.center
        textMake.placeholder = "Enter Make"
        textMake.backgroundColor = UIColor.white
        textMake.borderStyle = UITextBorderStyle.bezel
        textMake.keyboardType = UIKeyboardType.default
        textMake.returnKeyType = UIReturnKeyType.done
        textMake.clearButtonMode = UITextFieldViewMode.always
        textMake.delegate = self
        carScrollView.addSubview(textMake)
        
        //labelVin
        labelVin.text = "VIN"
        labelVin.backgroundColor = UIColor.white
        labelVin.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelVin.textColor = UIColor.black
        labelVin.textAlignment = NSTextAlignment.center
        labelVin.frame = CGRect(x: centerXWith10, y: (centerYWith10*65), width: centerX * 2, height: labelHeight)
        carScrollView.addSubview(labelVin)
        
        
        //textVin
        textVin.frame = CGRect(x: centerXWith10, y: (centerYWith10*75), width: centerX * 2, height: labelHeight)
        textVin.textColor = UIColor.black
        textVin.font = UIFont.systemFont(ofSize: 17.0)
        textVin.textAlignment = NSTextAlignment.center
        textVin.placeholder = "Enter Vin Number "
        textVin.backgroundColor = UIColor.white
        textVin.borderStyle = UITextBorderStyle.bezel
        textVin.keyboardType = UIKeyboardType.default
        textVin.returnKeyType = UIReturnKeyType.done
        textVin.clearButtonMode = UITextFieldViewMode.always
        textVin.delegate = self
        carScrollView.addSubview(textVin)
        
        
        //labelTransmission
        labelTransmission.text = "Transmission"
        labelTransmission.backgroundColor = UIColor.white
        labelTransmission.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelTransmission.textColor = UIColor.black
        labelTransmission.textAlignment = NSTextAlignment.center
        labelTransmission.frame = CGRect(x: centerXWith10, y: (centerYWith10*85), width: centerX * 2, height: labelHeight)
        carScrollView.addSubview(labelTransmission)
        
        //textTransmission
        textTransmission.frame = CGRect(x: centerXWith10, y: (centerYWith10*95), width: centerX * 2, height: labelHeight)
        textTransmission.textColor = UIColor.black
        textTransmission.font = UIFont.systemFont(ofSize: 17.0)
        textTransmission.textAlignment = NSTextAlignment.center
        textTransmission.placeholder = "Enter Transmission "
        textTransmission.backgroundColor = UIColor.white
        textTransmission.borderStyle = UITextBorderStyle.bezel
        textTransmission.keyboardType = UIKeyboardType.default
        textTransmission.returnKeyType = UIReturnKeyType.done
        textTransmission.clearButtonMode = UITextFieldViewMode.always
        textTransmission.delegate = self
        carScrollView.addSubview(textTransmission)
        
        
        //labelPlate
        labelPlate.text = "Plate"
        labelPlate.backgroundColor = UIColor.white
        labelPlate.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelPlate.textColor = UIColor.black
        labelPlate.textAlignment = NSTextAlignment.center
        labelPlate.frame = CGRect(x: centerXWith10, y: (centerYWith10*105), width: centerX * 2, height: labelHeight)
        carScrollView.addSubview(labelPlate)
        
        
        //textPlate
        textPlate.frame = CGRect(x: centerXWith10, y: (centerYWith10*115), width: centerX * 2, height: labelHeight)
        textPlate.textColor = UIColor.black
        textPlate.font = UIFont.systemFont(ofSize: 17.0)
        textPlate.textAlignment = NSTextAlignment.center
        textPlate.placeholder = "Enter Plate Number "
        textPlate.backgroundColor = UIColor.white
        textPlate.borderStyle = UITextBorderStyle.bezel
        textPlate.keyboardType = UIKeyboardType.default
        textPlate.returnKeyType = UIReturnKeyType.done
        textPlate.clearButtonMode = UITextFieldViewMode.always
        textPlate.delegate = self
        carScrollView.addSubview(textPlate)
        
        //labelengine
        labelengine.text = "Engine"
        labelengine.backgroundColor = UIColor.white
        labelengine.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelengine.textColor = UIColor.black
        labelengine.textAlignment = NSTextAlignment.center
        labelengine.frame = CGRect(x: centerXWith10, y: (centerYWith10*125), width: centerX * 2, height: labelHeight)
        carScrollView.addSubview(labelengine)
        
        
        //textengine
        textengine.frame = CGRect(x: centerXWith10, y: (centerYWith10*135), width: centerX * 2, height: labelHeight)
        textengine.textColor = UIColor.black
        textengine.font = UIFont.systemFont(ofSize: 17.0)
        textengine.textAlignment = NSTextAlignment.center
        textengine.placeholder = "Enter Engine type"
        textengine.backgroundColor = UIColor.white
        textengine.borderStyle = UITextBorderStyle.bezel
        textengine.keyboardType = UIKeyboardType.default
        textengine.returnKeyType = UIReturnKeyType.done
        textengine.clearButtonMode = UITextFieldViewMode.always
        textengine.delegate = self
        carScrollView.addSubview(textengine)
        
        //label Drivetrain
        labelDrivetrain.text = "Drivetrain"
        labelDrivetrain.backgroundColor = UIColor.white
        labelDrivetrain.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelDrivetrain.textColor = UIColor.black
        labelDrivetrain.textAlignment = NSTextAlignment.center
        labelDrivetrain.frame = CGRect(x: centerXWith10, y: (centerYWith10*145), width: centerX * 2, height: labelHeight)
        carScrollView.addSubview(labelDrivetrain)
        
        //TextDrivetrain
        textDrivetrain.frame = CGRect(x: centerXWith10, y: (centerYWith10*155), width: centerX * 2, height: labelHeight)
        textDrivetrain.textColor = UIColor.black
        textDrivetrain.font = UIFont.systemFont(ofSize: 17.0)
        textDrivetrain.textAlignment = NSTextAlignment.center
        textDrivetrain.placeholder = "Enter Drivetrain type"
        textDrivetrain.backgroundColor = UIColor.white
        textDrivetrain.borderStyle = UITextBorderStyle.bezel
        textDrivetrain.keyboardType = UIKeyboardType.default
        textDrivetrain.returnKeyType = UIReturnKeyType.done
        textDrivetrain.clearButtonMode = UITextFieldViewMode.always
        textDrivetrain.delegate = self
        carScrollView.addSubview(textDrivetrain)
        
        
        // Done Button
        doneButton.frame = CGRect(x: centerXWith10, y: screenSize.height * 0.9, width: (bottomOffset * 0.5) * 2 , height: bottomOffset * 0.5)
        //        doneButton.setImage(#imageLiteral(resourceName: "addbutton.png"), for: UIControlState.normal)
        doneButton.backgroundColor = UIColor.blue;
        doneButton.setTitle("Done", for: UIControlState.normal)
        doneButton.addTarget(self, action: #selector(ViewController.doneButtonPressed), for: UIControlEvents.touchUpInside)
        carScrollView.addSubview(doneButton)
        
        // add Picture Button
        addPicture.frame = CGRect(x: (bottomOffset * 0.5) * 3.4 + (centerXWith10 ) , y: screenSize.height * 0.9, width: (bottomOffset * 0.5) * 3.5, height: bottomOffset * 0.5)
        addPicture.setTitle("Add Picture", for: UIControlState.normal)
        addPicture.backgroundColor = UIColor.blue;
        addPicture.addTarget(self, action: #selector(ViewController.addPictureButtonPressed), for: UIControlEvents.touchUpInside)
        carScrollView.addSubview(addPicture)
        
        // Cancel Button
        cancelButton.frame = CGRect(x: centerX * 1.6 , y: screenSize.height * 0.9, width: (bottomOffset * 0.5) * 2, height: bottomOffset * 0.5)
        cancelButton.setTitle("Cancel", for: UIControlState.normal)
        cancelButton.backgroundColor = UIColor.blue;
        cancelButton.addTarget(self, action: #selector(ViewController.cancelButtonPressed), for: UIControlEvents.touchUpInside)
        carScrollView.addSubview(cancelButton)
        
        
        
        
        carPicture.backgroundColor = UIColor.yellow
        carPicture.frame = CGRect(x: centerXWith10, y: (centerYWith10*165), width: centerX * 2, height: labelHeight)
        
        carScrollView.addSubview(carPicture)
        carScrollView.backgroundColor = UIColor.red
        //mainScrollView.addSubview(addCarScrollView)
        //mainScrollView.bringSubview(toFront: addCarScrollView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // addbutton button Pressed method
    @objc func addButtonPressed() {
        
        let screenSize: CGSize = UIScreen.main.bounds.size
        let centerX: CGFloat = screenSize.width / 2
        let centerY: CGFloat = screenSize.height / 2
        
        // This height and width are for Textbox and Label height is .05% of the screens
        let labelHeight: CGFloat = screenSize.height * 0.05
        //        let labelWidth: CGFloat = screenSize.width * 1
        
        // For Center X and Y with 10%
        let centerXWith10: CGFloat = centerX * 0.01
        let centerYWith10: CGFloat = centerY * 0.01
        
        carPicture = UIImageView()
        carPicture.backgroundColor = UIColor.yellow
        carPicture.frame = CGRect(x: centerXWith10, y: (centerYWith10*165), width: centerX * 2, height: labelHeight)
        
        carScrollView.addSubview(carPicture)
        
        print("DONE Button Pressed")
        
        self.view.addSubview(carScrollView)
    }
    
    @objc func refreshButtonPressed() {
        
        print("refreshButtonPressed")
        refreshScrollView()
    }
    
    @objc func handleTapOnCar(_ recognizer: UITapGestureRecognizer) {
    
        print("Tap on car 1")
        let cv: CarView
        cv = CarView(CarToBeViewed: garage.nodeAt(index: 0).value)
        
        self.present(cv, animated: true) { () -> Void in
            NSLog("CarViewController")
        }
        
    }
    
    @objc func handleTapOnCar2(_ recognizer: UITapGestureRecognizer) {
        
        print("Tap on car 2")
        let cv: CarView
        cv = CarView(CarToBeViewed: garage.nodeAt(index: 0).value)
        
        self.present(cv, animated: true) { () -> Void in
            NSLog("CarViewController")
        }
        
    }
    
    @objc func handleTapOnCar3(_ recognizer: UITapGestureRecognizer) {
        
        let cv: CarView
        cv = CarView(CarToBeViewed: garage.nodeAt(index: 0).value)
        
        self.present(cv, animated: true) { () -> Void in
            NSLog("CarViewController")
        }
        
    }
    
    private func refreshScrollView() {
        var i: Int = 0
        for car in garage {
            print(car.value.make)
            i+=1
        }
        
        print(garage.nodeAt(index: 0).value.model)
        let tempCar: UIImageView = garage.nodeAt(index: 0).value.coverPhoto
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOnCar(_:)))
        
        tempCar.frame = CGRect(x: (carConstraints.width * 0.03), y: (carConstraints.width * 0.03), width: carLabelConstraints.width * 0.94, height: carLabelConstraints.height * 0.94)
        tempCar.isUserInteractionEnabled = true
        tempCar.addGestureRecognizer(gesture)
        self.mainScrollView.addSubview(tempCar)
        
        if carsIndex == 1 {
            
            let tempCar: UIImageView = garage.nodeAt(index: 1).value.coverPhoto
            let gesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOnCar2(_:)))
            
            tempCar.frame = CGRect(x: (self.carConstraints.width * 0.03), y: (carConstraints.width * 0.03) + ((carLabelConstraints.height)*1), width: carLabelConstraints.width * 0.94, height: carLabelConstraints.height * 0.94)
            tempCar.isUserInteractionEnabled = true
            tempCar.addGestureRecognizer(gesture)
            self.mainScrollView.addSubview(tempCar)
        }
        
        if carsIndex == 2 {
            print(garage.nodeAt(index: 2).value.model)
            let tempCar: UIImageView = garage.nodeAt(index: 2).value.coverPhoto
            let gesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOnCar3(_:)))
            
            tempCar.frame = CGRect(x: (self.carConstraints.width * 0.03), y: (carConstraints.width * 0.03) + ((carLabelConstraints.height)*2), width: carLabelConstraints.width * 0.94, height: carLabelConstraints.height * 0.94)
            tempCar.isUserInteractionEnabled = true
            tempCar.addGestureRecognizer(gesture)
            self.mainScrollView.addSubview(tempCar)
        }
        
        
        print("ScrollView refreshed")
    }
    
    // Done button button Pressed method
    @objc func doneButtonPressed() {
        let year :String =  textYear.text!
        let make : String = textMake.text!
        let model : String = textModel.text!
        let engine : String = textengine.text!
        let transmission : String = textTransmission.text!
        let plate : String = textPlate.text!
        
        
        
        let newCar = Car(y: year, m: make, mo: model, eng: engine, trans: transmission, plt: plate)
        
        
        newCar.coverPhoto = carPicture
        
        print("DONE Button Pressed")
        
        
        print(year)
        print(make)
        print(model)
        print(engine)
        print(transmission)
        print(plate)
        
        garage.append(value: newCar)
        
        carsIndex+=1
        
        self.carScrollView.removeFromSuperview()
        
    }
    
    // Cancel button button Pressed method
    @objc func cancelButtonPressed() {
        
        print("CANCEL ButtonPressed")
        let vc: ViewController = ViewController()
        self.present(vc, animated: true) { () -> Void in
            NSLog("Back to main Screen VC")
        }
    }
    
    // Add picture button button Pressed method
    @objc func addPictureButtonPressed() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        
        
        print("ADD Picture Button Pressesd ")
        
    }
    
    
    // this is a TEST
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            carPicture.contentMode = .scaleToFill
            carPicture.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    // this Func is for Textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TEXT field for ")// textYear
        if textYear == textField {
            //            textVin.text = textYear.text
            if textYear.text == "Hide" {
                textYear.resignFirstResponder()   // hide keyboard
                textYear.isHidden = true          // hide textfield
                
                // or remove it from subview
            }
        }
        // this textModel
        if textModel == textField {
            //            textPlate.text = textModel.text
            if textModel.text == "Hide" {
                textModel.resignFirstResponder()   // hide keyboard
                textModel.isHidden = true          // hide textfield
                
                // or remove it from subview
            }
        }
        return true
    }
    
    class CarView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        private let imagePickButton: UIButton
        
        private let currentCar: Car
        private let currentCarName: String

        
        
        
        
        private let carImage: UIImageView
        
        init(CarToBeViewed: Car) {
            
            currentCar = CarToBeViewed
            currentCarName = currentCar.toString()
            imagePickButton = UIButton()
            carImage = UIImageView()
            
            let screenSize: CGSize = UIScreen.main.bounds.size
            let centerX: CGFloat = screenSize.width / 2
            let centerY: CGFloat = screenSize.height / 2
            let topOffset: CGFloat = screenSize.height * 0.10
            let topLeftTitleOffset: CGFloat = topOffset * 0.1
            let carConstraints = CGRect(x: 0, y: topOffset, width: screenSize.width, height: screenSize.height-topOffset)
            let carLabelConstraints = CGSize(width: screenSize.width, height: screenSize.width * (9/16))
            
            
            
            super.init(nibName: nil, bundle: nil)
            //self.view.backgroundColor = UIColor.blue
            
            // add Picture Button
            imagePickButton.frame = CGRect(x: centerX - 30 , y: screenSize.height * 0.9, width: 60 , height: 60)
            imagePickButton.setTitle("addPicture", for: UIControlState.normal)
            imagePickButton.backgroundColor = UIColor.red;
            imagePickButton.addTarget(self, action: #selector(CarView.loadImageButtonTapped), for: UIControlEvents.touchUpInside)
            // addCarScrollView.addSubview(addPicture)
            
            carImage.frame = CGRect(x: (carConstraints.width * 0.03), y: (carConstraints.width * 0.03), width: carLabelConstraints.width * 0.94, height: carLabelConstraints.height * 0.94)
            self.view.addSubview(carImage)
            self.view.addSubview(imagePickButton)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        @objc func loadImageButtonTapped(sender: UIButton) {
            //if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
            //}
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
    }
    

    
}
