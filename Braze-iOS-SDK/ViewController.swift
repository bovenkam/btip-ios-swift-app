//
//  ViewController.swift
//  Braze-iOS-SDK
//
//  Created by Martijn van de Bovenkamp on 5/9/22.
//  Copyright © 2022 Martijn van de Bovenkamp. All rights reserved.
//

import UIKit
import AppboyUI


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
    
    // Actions
    @IBAction func customContentCardClicked(_ sender: Any) {
        //INSERT CONTENT CARD CODE HERE
       

        
    }
    
    @IBAction func inboxButtonClicked(_ sender: Any) {
        //INSERT CONTENT CARD CODE HERE
        let contentCards = ABKContentCardsViewController()
        contentCards.contentCardsViewController.title = "Content Cards Title"
        contentCards.contentCardsViewController.disableUnreadIndicator = true
        self.present(contentCards, animated: true, completion: nil)

        
        
    }
    
    
    @IBAction func userIdSubmit(_ sender: Any) {
        // Below code will execute when User ID Submit button is pressed
        if let userIDVal = userIdText.text, !userIDVal.isEmpty {
            Utilities().ShowAlert(title: "User ID set!", message: "With value: \(userIDVal)", vc: self)
            print(userIDVal)
            
            // Insert SDK Method to set External User ID
            Appboy.sharedInstance()?.changeUser(userIDVal)
        }
    }
    
    @IBAction func firstNameSubmit(_ sender: Any) {
        // Below code will execute when First Name Submit button is pressed
        if let firstNameVal = firstNameText.text, !firstNameVal.isEmpty {
            Utilities().ShowAlert(title: "First Name set!", message: "With value: \(firstNameVal)", vc: self)
            print(firstNameVal)
            
            // Insert SDK Method to set First Name
            Appboy.sharedInstance()?.user.firstName = firstNameVal
        }
    }
    
    @IBAction func lastNameSubmit(_ sender: Any) {
        // Below code will execute when Last Name Submit button is pressed
        if let lastNameVal = lastNameText.text, !lastNameVal.isEmpty {
            Utilities().ShowAlert(title: "Last Name set!", message: "With value: \(lastNameVal)", vc: self)
            print(lastNameVal)
            
            // Insert SDK Method to set Last Name
            Appboy.sharedInstance()?.user.lastName = lastNameVal
        }
    }
    
    @IBAction func emailSubmit(_ sender: Any) {
        // Below code will execute when Email Submit button is pressed
        
        if let emailVal = emailText.text, !emailVal.isEmpty {
            Utilities().ShowAlert(title: "Email address set!", message: "With value: \(emailVal)", vc: self)
             print(emailVal)
             
             // Insert SDK Method to set Email
            Appboy.sharedInstance()?.user.email = emailVal
        }
    }
    
    @IBAction func phoneSubmit(_ sender: Any) {
        // Below code will execute when Phone Submit button is pressed
        if let phoneVal = phoneText.text, !phoneVal.isEmpty {
            Utilities().ShowAlert(title: "Phone Number set!", message: "With value: \(phoneVal)", vc: self)
            print(phoneVal)
            
            // Insert SDK Method to set Phone
        }
    }
    

    @IBAction func dobSubmit(_ sender: Any) {
        // Below code will execute when Phone Submit button is pressed
        if let dobVal = dateOfBirth?.date {
            Utilities().ShowAlert(title: "Date of Birth set!", message: "With value: \(dobVal)", vc: self)
            print(dobVal)
            
            // Insert SDK Method to set Phone
            Appboy.sharedInstance()?.user.dateOfBirth = dobVal
        }
    }
    
  
    
    // MARK: CUSTOM ATTRIBUTES
    

    
    @IBAction func customAttributeSet(_ sender: Any) {
        // Below code will execute when Custom Attributes Submit button is pressed
        if let custAttrKey = customAttributeKeyText.text, let custAttrVal = customAttributeValText.text, !custAttrKey.isEmpty && !custAttrVal.isEmpty {
            Utilities().ShowAlert(title: "Custom Attribute set!", message: "With key: \(custAttrKey) and value: \(custAttrVal)", vc: self)

            print(custAttrKey)
            print(custAttrVal)
            
            // Insert SDK Method to log a Custom Attribute
            Appboy.sharedInstance()?.user.setCustomAttributeWithKey(custAttrKey, andStringValue: custAttrVal)
        }
    }
    
    
    // MARK: CUSTOM EVENTS
    
    @IBAction func customEventSubmit(_ sender: Any) {
        // Below code will execute when Custom Event button is pressed
        if let eventKey = customEventText.text, !eventKey.isEmpty {
                guard let propertyKey = customEventPropertyKey.text, let propertyVal = customEventPropertyValue.text, !propertyKey.isEmpty, !propertyVal.isEmpty else {
                print(eventKey)
                Utilities().ShowAlert(title: "\(eventKey) set!", message: "With no key/value", vc: self)
                // Insert SDK Method to log Custom Event WITHOUT an Event Property
                Appboy.sharedInstance()?.logCustomEvent(eventKey)
                
                return
            }
            
            print(eventKey)
            print(propertyKey)
            print(propertyVal)
            Utilities().ShowAlert(title: "\(eventKey) set!", message: "With key: \(propertyKey) and value: \(propertyVal)", vc: self)
            
            // Insert SDK Method to log Custom Event WITH an Event Property
            Appboy.sharedInstance()?.logCustomEvent(eventKey, withProperties:[propertyKey:propertyVal])
            
        }
    }
        
    // -------------------NO ACTION NEEDED BELOW HERE------------------------


    override func viewDidLoad() {
        super.viewDidLoad()
        //remove keyboard after clicking anywhere outside the keyboard area
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        
        //UIStackView.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
        //addToolBar()
    }

}

