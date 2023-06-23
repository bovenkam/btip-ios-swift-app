//
//  Utilities.swift
//  Braze-iOS-SDK
//
//  Created by Martijn van de Bovenkamp on 17/05/2022.
//  Copyright © 2022 Braze. All rights reserved.
//

import UIKit

class Utilities {
    static func showAlert (title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func getDate () -> String {
        let today: Date = Date()
        var dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        return dateFormatter.string(from: today)
    }
}


