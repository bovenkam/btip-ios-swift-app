//
//  ViewController.swift
//  Braze-iOS-SDK
//
//  Created by Martijn van de Bovenkamp on 5/9/22.
//  Copyright © 2022 Braze. All rights reserved.
//

import UIKit
import BrazeUI

class ViewController: UIViewController, UITextFieldDelegate {
    // Outlets
    @IBOutlet weak var userIdText: UITextField!
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var dateOfBirth: UIDatePicker!
    @IBOutlet weak var customAttributeValText: UITextField!
    @IBOutlet weak var customAttributeKeyText: UITextField!
    @IBOutlet weak var customEventText: UITextField!
    @IBOutlet weak var customEventPropertyValue: UITextField!
    @IBOutlet weak var customEventPropertyKey: UITextField!
    @IBOutlet weak var inboxButton: UIBarButtonItem!
    @IBOutlet weak var customContentCardsButton: UIBarButtonItem!
    
    // MARK: ACTIONS
    @IBAction func clickedCustomInbox(_ sender: Any) {
    }
    
    @IBAction func clickedInboxButton(_ sender: Any) {
        // Insert Content Card Code here
        guard let braze = AppDelegate.braze else { return }
        let viewController = BrazeContentCardUI.ViewController(braze: braze)
        self.present(viewController, animated: true)
    }
    
    @IBAction func submitUserId(_ sender: Any) {
        // Below code will execute when User ID Submit button is pressed
        if let userIDVal = userIdText.text, !userIDVal.isEmpty {
            Utilities.showAlert(title: "User ID set!", message: "With value: \(userIDVal)", vc: self)
            print(userIDVal)
            
            // TODO: Insert SDK Method to set External User ID here
            
        }
    }
    
    @IBAction func submitFirstName(_ sender: Any) {
        // Below code will execute when First Name Submit button is pressed
        if let firstNameVal = firstNameText.text, !firstNameVal.isEmpty {
            Utilities.showAlert(title: "First Name set!", message: "With value: \(firstNameVal)", vc: self)
            print(firstNameVal)
            
            // TODO: Insert SDK Method to set First Name here
            
        }
    }
    
    @IBAction func submitLastName(_ sender: Any) {
        // Below code will execute when Last Name Submit button is pressed
        if let lastNameVal = lastNameText.text, !lastNameVal.isEmpty {
            Utilities.showAlert(title: "Last Name set!", message: "With value: \(lastNameVal)", vc: self)
            print(lastNameVal)
            
            // TODO: Insert SDK Method to set Last Name here
            
        }
    }
    
    @IBAction func submitEmail(_ sender: Any) {
        // Below code will execute when Email Submit button is pressed
        if let emailVal = emailText.text, !emailVal.isEmpty {
            Utilities.showAlert(title: "Email address set!", message: "With value: \(emailVal)", vc: self)
             print(emailVal)
             
             // TODO: Insert SDK Method to set Email here
            
        }
    }
    
    @IBAction func submitPhonenumber(_ sender: Any) {
        // Below code will execute when Phone Submit button is pressed
        if let phoneVal = phoneText.text, !phoneVal.isEmpty {
            Utilities.showAlert(title: "Phone Number set!", message: "With value: \(phoneVal)", vc: self)
            print(phoneVal)
            
            // TODO: Insert SDK Method to set Phone here
            
        }
    }
    
    @IBAction func submitDob(_ sender: Any) {
        // Below code will execute when date of birth button is pressed
        if let dobVal = dateOfBirth?.date {
            Utilities.showAlert(title: "Date of Birth set!", message: "With value: \(dobVal)", vc: self)
            print(dobVal)
            
            // TODO: Insert SDK Method to set Date of Birth here
            
        }
    }
    
    // MARK: CUSTOM ATTRIBUTES
    @IBAction func setCustomAttribute(_ sender: Any) {
        // Below code will execute when the Custom Attributes set button is pressed
        if let custAttrKey = customAttributeKeyText.text, let custAttrVal = customAttributeValText.text, !custAttrKey.isEmpty && !custAttrVal.isEmpty {
            Utilities.showAlert(title: "Custom Attribute set!", message: "With key: \(custAttrKey) and value: \(custAttrVal)", vc: self)
            print(custAttrKey)
            print(custAttrVal)
            
            // TODO: Insert SDK Method to log a Custom Attribute here
            
        }
    }
    
    // MARK: CUSTOM EVENTS
    @IBAction func submitCustomEvent(_ sender: Any) {
        // Below code will execute when the Custom Event set button is pressed
        if let eventKey = customEventText.text, !eventKey.isEmpty {
                guard let propertyKey = customEventPropertyKey.text, let propertyVal = customEventPropertyValue.text, !propertyKey.isEmpty, !propertyVal.isEmpty else {
                print(eventKey)
                Utilities.showAlert(title: "\(eventKey) set!", message: "With no key/value", vc: self)
                // TODO: Insert SDK Method to log Custom Event WITHOUT an Event Property here
                
                return
            }
            print(eventKey)
            print(propertyKey)
            print(propertyVal)
            Utilities.showAlert(title: "\(eventKey) set!", message: "With key: \(propertyKey) and value: \(propertyVal)", vc: self)
            
            // TODO: Insert SDK Method to log Custom Event WITH an Event Property here
            
        }
    }
        
    // -------------------NO ACTION NEEDED BELOW HERE------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        //remove keyboard after clicking anywhere outside the keyboard area
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

