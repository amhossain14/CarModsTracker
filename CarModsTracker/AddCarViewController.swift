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


class AddCarViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate {

    //Label
    let labelYear: UILabel
    let labelModel : UILabel
    let labelMake : UILabel
    let labelVin: UILabel
    let labelTransmission : UILabel
    let labelPlate : UILabel

    //TextField
    let textYear: UITextField
    let textModel:UITextField
    let textMake:UITextField
    let textVin: UITextField
    let textTransmission : UITextField
    let textPlate : UITextField
    
    // Button
    let doneButton: UIButton
    let cancelButton: UIButton
    let addPicture: UIButton
    
    
    init() {
        
        // Labels
        labelYear = UILabel()
        labelModel = UILabel()
        labelMake = UILabel()
        labelVin = UILabel()
        labelTransmission = UILabel()
        labelPlate = UILabel()
        
        
        // Texts
        textYear = UITextField()
        textModel = UITextField()
        textMake = UITextField()
        textVin = UITextField()
        textTransmission = UITextField()
        textPlate = UITextField()
        
        // Buttons
        doneButton = UIButton(type: UIButtonType.custom)
        cancelButton = UIButton(type: UIButtonType.custom)
        addPicture  = UIButton(type: UIButtonType.custom)
        
        let screenSize: CGSize = UIScreen.main.bounds.size
        let centerX: CGFloat = screenSize.width / 2
        let centerY: CGFloat = screenSize.height / 2
        
        // This height and width are for Textbox and Label height is .05% of the screens and Width is 0.15%
        let labelHeight: CGFloat = screenSize.height * 0.05
        let labelWidth: CGFloat = screenSize.width * 1
        
        // For Center X and Y with 10%
        let centerXWith10: CGFloat = centerX * 0.01
        let centerYWith10: CGFloat = centerY * 0.01
        
        // for buttons position
        let bottomOffset: CGFloat = screenSize.height * 0.10
        
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
        labelYear.font = UIFont.boldSystemFont(ofSize: 20.0)
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
        labelModel.font = UIFont.boldSystemFont(ofSize: 20.0)
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
        labelMake.font = UIFont.boldSystemFont(ofSize: 20.0)
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
        
        //labelVin
        labelVin.text = "VIN"
        labelVin.backgroundColor = UIColor.white
        labelVin.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelVin.textColor = UIColor.black
        labelVin.textAlignment = NSTextAlignment.center
        labelVin.frame = CGRect(x: centerXWith10, y: (centerYWith10*65), width: labelWidth, height: labelHeight)
        addCarScrollView.addSubview(labelVin)
        
        
        //textVin
        textVin.frame = CGRect(x: centerXWith10, y: (centerYWith10*75), width: labelWidth, height: labelHeight)
        textVin.textColor = UIColor.black
        textVin.font = UIFont.systemFont(ofSize: 17.0)
        textVin.textAlignment = NSTextAlignment.center
        textVin.placeholder = " Enter Vin Number "
        textVin.backgroundColor = UIColor.white
        textVin.borderStyle = UITextBorderStyle.bezel
        textVin.keyboardType = UIKeyboardType.default
        textVin.returnKeyType = UIReturnKeyType.done
        textVin.clearButtonMode = UITextFieldViewMode.always
        textVin.delegate = self
        addCarScrollView.addSubview(textVin)
        
        
        //labelTransmission
        labelTransmission.text = "Transmission"
        labelTransmission.backgroundColor = UIColor.white
        labelTransmission.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelTransmission.textColor = UIColor.black
        labelTransmission.textAlignment = NSTextAlignment.center
        labelTransmission.frame = CGRect(x: centerXWith10, y: (centerYWith10*85), width: labelWidth, height: labelHeight)
        addCarScrollView.addSubview(labelTransmission)
        
        //textTransmission
        textTransmission.frame = CGRect(x: centerXWith10, y: (centerYWith10*95), width: labelWidth, height: labelHeight)
        textTransmission.textColor = UIColor.black
        textTransmission.font = UIFont.systemFont(ofSize: 17.0)
        textTransmission.textAlignment = NSTextAlignment.center
        textTransmission.placeholder = " Enter Transmission "
        textTransmission.backgroundColor = UIColor.white
        textTransmission.borderStyle = UITextBorderStyle.bezel
        textTransmission.keyboardType = UIKeyboardType.default
        textTransmission.returnKeyType = UIReturnKeyType.done
        textTransmission.clearButtonMode = UITextFieldViewMode.always
        textTransmission.delegate = self
        addCarScrollView.addSubview(textTransmission)
    
        
        //labelPlate
        labelPlate.text = "Plate"
        labelPlate.backgroundColor = UIColor.white
        labelPlate.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelPlate.textColor = UIColor.black
        labelPlate.textAlignment = NSTextAlignment.center
        labelPlate.frame = CGRect(x: centerXWith10, y: (centerYWith10*105), width: labelWidth, height: labelHeight)
        addCarScrollView.addSubview(labelPlate)
        
        
        //textPlate
        textPlate.frame = CGRect(x: centerXWith10, y: (centerYWith10*115), width: labelWidth, height: labelHeight)
        textPlate.textColor = UIColor.black
        textPlate.font = UIFont.systemFont(ofSize: 17.0)
        textPlate.textAlignment = NSTextAlignment.center
        textPlate.placeholder = " Enter Plate Number "
        textPlate.backgroundColor = UIColor.white
        textPlate.borderStyle = UITextBorderStyle.bezel
        textPlate.keyboardType = UIKeyboardType.default
        textPlate.returnKeyType = UIReturnKeyType.done
        textPlate.clearButtonMode = UITextFieldViewMode.always
        textPlate.delegate = self
        addCarScrollView.addSubview(textPlate)
        

        // Done Button
        doneButton.frame = CGRect(x: centerXWith10, y: screenSize.height * 0.9, width: bottomOffset * 0.5, height: bottomOffset * 0.5)
        doneButton.setImage(#imageLiteral(resourceName: "addbutton.png"), for: UIControlState.normal)
        doneButton.backgroundColor = UIColor.red;
//        doneButton.setTitle("Done", for: UIControlState.normal)
        doneButton.addTarget(self, action: #selector(AddCarViewController.doneButtonPressed), for: UIControlEvents.touchUpInside)
        addCarScrollView.addSubview(doneButton)
        
        // Cancel Button
        cancelButton.frame = CGRect(x: centerX + 145, y: screenSize.height * 0.9, width: 20 + bottomOffset * 0.5, height: bottomOffset * 0.5)
        cancelButton.setTitle("Cancel", for: UIControlState.normal)
        cancelButton.backgroundColor = UIColor.blue;
        cancelButton.addTarget(self, action: #selector(AddCarViewController.cancelButtonPressed), for: UIControlEvents.touchUpInside)
        addCarScrollView.addSubview(cancelButton)
        
        
        // add Picture Button
        addPicture.frame = CGRect(x: centerX - 30 , y: screenSize.height * 0.9, width: 60 + bottomOffset * 0.5, height: bottomOffset * 0.5)
        addPicture.setTitle("addPicture", for: UIControlState.normal)
        addPicture.backgroundColor = UIColor.blue;
        addPicture.addTarget(self, action: #selector(AddCarViewController.addPictureButtonPressed), for: UIControlEvents.touchUpInside)
        addCarScrollView.addSubview(addPicture)
        
//        self.view.bringSubview(toFront: doneButton)/// bring to the front
//        self.view.bringSubview(toFront: cancelButton)/// bring to the front
        self.view = addCarScrollView
//        self.view.backgroundColor = UIColor(red: 0.83984375, green: 0.85546875, blue: 0.84375, alpha: 1.0)
   
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
    
    // Done button button Pressed method
    @objc func doneButtonPressed() {
        
        print("Done ButtonPressed")

        
    }
    
    // Cancel button button Pressed method
    @objc func cancelButtonPressed() {
        
        print("Cancel ButtonPressed")
        let vc: ViewController = ViewController()
        self.present(vc, animated: true) { () -> Void in
            NSLog("Back to main Screen VC")
        }
    }
    
    // Add picture button button Pressed method
    @objc func addPictureButtonPressed() {
        
        print("add Picture Button Pressed ")

    }
    
}
