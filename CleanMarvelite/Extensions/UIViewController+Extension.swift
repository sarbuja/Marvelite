//
//  UIViewController+Extension.swift
//  CleanMarvelite
//
//  Created by Santa Gurung on 02/01/2021.
//

import UIKit

extension UIViewController {

    func presentAlert(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
