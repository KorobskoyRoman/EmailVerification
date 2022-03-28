//
//  Alerts.swift
//  EmailVerification
//
//  Created by Roman Korobskoy on 28.03.2022.
//

import Foundation
import UIKit

struct Alert {
    private static func showSimpleAlert(controller: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(ok)
        
        DispatchQueue.main.async {
            controller.present(alertController, animated: true, completion: nil)
        }
    }
    
    private static func showChangeAlert(controller: UIViewController, title: String, message: String, completion: @escaping ()-> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        
        DispatchQueue.main.async {
            controller.present(alertController, animated: true, completion: nil)
        }
    }
    
    static func showResultAlert(controller: UIViewController, message: String) {
        showSimpleAlert(controller: controller, title: "Result", message: message)
    }
    
    static func showErrorAlert(controller: UIViewController, message: String, completion: @escaping () -> Void) {
        showChangeAlert(controller: controller, title: "Error!", message: message, completion: completion)
    }
}
