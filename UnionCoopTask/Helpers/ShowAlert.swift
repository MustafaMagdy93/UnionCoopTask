//
//  Constants.swift
//  NetworkLayer
//
//  Created by Ahmed masoud on 6/19/20.
//  Copyright © 2020 Ahmed Masoud. All rights reserved.
//

import Foundation
import UIKit


//struct ErrorMessage {
//    static let genericError = "Something went wrong please try again later"
//}

class ShowAlert: UIViewController {
    
    class func alertUser(styleController: UIAlertController.Style, messageTitle: String?, messageBody: String?, actionTitleOne: String?, actionStyleOne: UIAlertAction.Style, actionTitleTwo: String?, actionStyleTwo: UIAlertAction.Style , viewController: UIViewController) {
            
        let alertController = UIAlertController(title: messageTitle, message: messageBody, preferredStyle: styleController)
        let actionOne = UIAlertAction(title: actionTitleOne, style: actionStyleOne)
            alertController.addAction(actionOne)
        
        if actionTitleTwo != nil && actionTitleTwo != ""{
            let actionTwo = UIAlertAction(title: actionTitleTwo, style: actionStyleTwo)
            alertController.addAction(actionTwo)
        }
            viewController.present(alertController, animated: true)
    }

}
