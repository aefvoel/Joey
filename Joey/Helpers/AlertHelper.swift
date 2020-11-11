//
//  AlertHelper.swift
//  Macro43
//
//  Created by Rahman Fadhil on 08/10/20.
//
import Foundation
import UIKit

class AlertHelper {
    // Create an alert with "Okay" button.
    static func createAlert(title: String, message: String, onComplete: ( () -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) in
            if let onComplete = onComplete {
                onComplete()
            }
        }))
        return alert
    }
    
    // Create a questionnaire alert with "Yes" and "No" button.
    static func createPrompt(title: String, question: String, onComplete: @escaping (Bool) -> Void) -> UIAlertController {
        let alert = UIAlertController(title: title, message: question, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            onComplete(false)
        }))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            onComplete(true)
        }))
        return alert
    }
}
