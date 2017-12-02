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


class AddCarViewController: UIViewController,UITextFieldDelegate,UIScrollViewDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    // this is test
     var carPicture: UIImageView
    let currentGarage: linkedList<Car>
    
    
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
    let textTransmission : UITextField
    let textPlate : UITextField
    let textengine : UITextField
    let textDrivetrain : UITextField
    
    // Button
    let doneButton: UIButton
    let cancelButton: UIButton
    let addPicture: UIButton
    
    
    init(theGarage : linkedList<Car>) {
        // this is test
             carPicture = UIImageView()
        currentGarage = theGarage
        
        
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
        
        //Here's Super Init
        super.init(nibName: nil, bundle: nil)
        
        //this is for scrollView
        let addCarScrollView: UIScrollView = UIScrollView() // this make sure its full screen
        addCarScrollView.delegate = self
        addCarScrollView.showsHorizontalScrollIndicator = false
        addCarScrollView.showsVerticalScrollIndicator = true
        addCarScrollView.contentSize = CGSize(width: screenSize.width, height: screenSize.height*1.0001)
        addCarScrollView.backgroundColor = UIColor.red
        
       // Label for Year
        labelYear.text = "Year"
        labelYear.backgroundColor = UIColor.white
        labelYear.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelYear.textColor = UIColor.black
        labelYear.textAlignment = NSTextAlignment.center
        labelYear.frame = CGRect(x: centerXWith10, y: (centerYWith10*5), width: centerX * 2, height: labelHeight)
        addCarScrollView.addSubview(labelYear)
        
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
        addCarScrollView.addSubview(textYear)
        
        // Label for MODEL
        labelModel.text = "Model"
        labelModel.backgroundColor = UIColor.white
        labelModel.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelModel.textColor = UIColor.black
        labelModel.textAlignment = NSTextAlignment.center
        labelModel.frame = CGRect(x: centerXWith10, y: (centerYWith10*25), width: centerX * 2, height: labelHeight)
        addCarScrollView.addSubview(labelModel)
        
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
        addCarScrollView.addSubview(textModel)
        
        // Label for MAKE
        labelMake.text = "Make"
        labelMake.backgroundColor = UIColor.white
        labelMake.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelMake.textColor = UIColor.black
        labelMake.textAlignment = NSTextAlignment.center
        labelMake.frame = CGRect(x: centerXWith10, y: (centerYWith10*45), width: centerX * 2, height: labelHeight)
        addCarScrollView.addSubview(labelMake)

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
        addCarScrollView.addSubview(textMake)
        
        //labelVin
        labelVin.text = "VIN"
        labelVin.backgroundColor = UIColor.white
        labelVin.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelVin.textColor = UIColor.black
        labelVin.textAlignment = NSTextAlignment.center
        labelVin.frame = CGRect(x: centerXWith10, y: (centerYWith10*65), width: centerX * 2, height: labelHeight)
        addCarScrollView.addSubview(labelVin)
        
        
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
        addCarScrollView.addSubview(textVin)
        
        
        //labelTransmission
        labelTransmission.text = "Transmission"
        labelTransmission.backgroundColor = UIColor.white
        labelTransmission.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelTransmission.textColor = UIColor.black
        labelTransmission.textAlignment = NSTextAlignment.center
        labelTransmission.frame = CGRect(x: centerXWith10, y: (centerYWith10*85), width: centerX * 2, height: labelHeight)
        addCarScrollView.addSubview(labelTransmission)
        
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
        addCarScrollView.addSubview(textTransmission)
    
        
        //labelPlate
        labelPlate.text = "Plate"
        labelPlate.backgroundColor = UIColor.white
        labelPlate.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelPlate.textColor = UIColor.black
        labelPlate.textAlignment = NSTextAlignment.center
        labelPlate.frame = CGRect(x: centerXWith10, y: (centerYWith10*105), width: centerX * 2, height: labelHeight)
        addCarScrollView.addSubview(labelPlate)
        
        
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
        addCarScrollView.addSubview(textPlate)
        
        //labelengine
        labelengine.text = "Engine"
        labelengine.backgroundColor = UIColor.white
        labelengine.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelengine.textColor = UIColor.black
        labelengine.textAlignment = NSTextAlignment.center
        labelengine.frame = CGRect(x: centerXWith10, y: (centerYWith10*125), width: centerX * 2, height: labelHeight)
        addCarScrollView.addSubview(labelengine)
        
        
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
        addCarScrollView.addSubview(textengine)
        
        //label Drivetrain
        labelDrivetrain.text = "Drivetrain"
        labelDrivetrain.backgroundColor = UIColor.white
        labelDrivetrain.font = UIFont.boldSystemFont(ofSize: 20.0)
        labelDrivetrain.textColor = UIColor.black
        labelDrivetrain.textAlignment = NSTextAlignment.center
        labelDrivetrain.frame = CGRect(x: centerXWith10, y: (centerYWith10*145), width: centerX * 2, height: labelHeight)
        addCarScrollView.addSubview(labelDrivetrain)
        
        
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
        addCarScrollView.addSubview(textDrivetrain)
        

        // Done Button
        doneButton.frame = CGRect(x: centerXWith10, y: screenSize.height * 0.9, width: (bottomOffset * 0.5) * 2 , height: bottomOffset * 0.5)
//        doneButton.setImage(#imageLiteral(resourceName: "addbutton.png"), for: UIControlState.normal)
        doneButton.backgroundColor = UIColor.blue;
        doneButton.setTitle("Done", for: UIControlState.normal)
        doneButton.addTarget(self, action: #selector(AddCarViewController.doneButtonPressed), for: UIControlEvents.touchUpInside)
        addCarScrollView.addSubview(doneButton)
        
        // add Picture Button
        addPicture.frame = CGRect(x: (bottomOffset * 0.5) * 3.4 + (centerXWith10 ) , y: screenSize.height * 0.9, width: (bottomOffset * 0.5) * 3.5, height: bottomOffset * 0.5)
        addPicture.setTitle("Add Picture", for: UIControlState.normal)
        addPicture.backgroundColor = UIColor.blue;
        addPicture.addTarget(self, action: #selector(AddCarViewController.addPictureButtonPressed), for: UIControlEvents.touchUpInside)
        addCarScrollView.addSubview(addPicture)
        
        // Cancel Button
        cancelButton.frame = CGRect(x: centerX * 1.6 , y: screenSize.height * 0.9, width: (bottomOffset * 0.5) * 2, height: bottomOffset * 0.5)
        cancelButton.setTitle("Cancel", for: UIControlState.normal)
        cancelButton.backgroundColor = UIColor.blue;
        cancelButton.addTarget(self, action: #selector(AddCarViewController.cancelButtonPressed), for: UIControlEvents.touchUpInside)
        addCarScrollView.addSubview(cancelButton)
        
        

        
        carPicture.backgroundColor = UIColor.yellow
        //        pic.image = UIImage(named: "play.png")
        //        self.view.addSubview(play) // to add on the screen
        carPicture.frame = CGRect(x: centerXWith10, y: (centerYWith10*165), width: centerX * 2, height: labelHeight)
        
        addCarScrollView.addSubview(carPicture)
        
        
//        self.view.bringSubview(toFront: doneButton)/// bring to the front
//        self.view.bringSubview(toFront: cancelButton)/// bring to the front
        self.view = addCarScrollView
        self.view.backgroundColor = UIColor(red: 0.83984375, green: 0.85546875, blue: 0.84375, alpha: 1.0)
   
        
        
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
        let year :String =  textYear.text!
        let make : String = textMake.text!
        let model : String = textModel.text!
        let engine : String = textengine.text!
        let transmission : String = textTransmission.text!
        let plate : String = textPlate.text!
        
        
        
        let newCar : Car = Car(y: year, m: make, mo: model, eng: engine, trans: transmission, plt: plate)
        
       
        newCar.coverPhoto = carPicture
        
        print("DONE Button Pressed")
        
        
        print(year)
        print(make)
        print(model)
        print(engine)
        print(transmission)
        print(plate)
        
        
   
//        let vc: ViewController = ViewController()
        self.present(ViewController(), animated: true) { () -> Void in
            NSLog("Back to main Screen VC")
        }
        
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

        

//        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
//            let imagePicker = UIImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
//            imagePicker.allowsEditing = false
//            self.present(imagePicker, animated: true, completion: nil)
//        }
        
        
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
    
    
    // this one Only Year
//    func textField(_ textYear: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
//        // non decimal digit character set, better save this as a property instead of creating it for each keyboard stroke
//        let non_digits = NSCharacterSet.decimalDigits.inverted
//        // Find location for non digits
//        let range = string.rangeOfCharacter(from: non_digits)
//        if range == nil { // no non digits found, allow change
//
//            return true
//        }
//        return false // range was valid, meaning non digits were found
//    }
    
    
    
    

}
