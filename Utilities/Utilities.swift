//
//  Utilities.swift
//  Braze-iOS-SDK
//
//  Created by Martijn van de Bovenkamp on 17/05/2022.
//  Copyright © 2022 Ian Abels. All rights reserved.
//

import Foundation

import UIKit

class Utilities {

    func ShowAlert (title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    func GetDate () -> String {
        let today: Date = Date()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        return dateFormatter.string(from: today)
        
    }
}


