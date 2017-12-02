//
//  CarView.swift
//  CarModsTracker
//
//  Created by Shane Saunders on 11/4/17.
//  Copyright © 2017 Team 527. All rights reserved.
//
// This handles the Modal View Controller for when a user opens up a car (from a car label)

import UIKit

class CarView: UIViewController, UIImagePickerControllerDelegate {
    
    private let imagePicker = UIImagePickerController()
    
    private let imagePickButton: UIButton
    
    private let currentCar: Car
    private let currentCarName: String
    /*
    private let nameLabel: UILabel
    private let engineLabel: UILabel
    private let transmissionLabel: UILabel
    */
    
    
    
    
    
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
    
    @IBAction func loadImageButtonTapped(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
    }
    
    // MARK: - UIImagePickerControllerDelegate Methods
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            carImage.contentMode = .scaleAspectFit
            carImage.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    private func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

