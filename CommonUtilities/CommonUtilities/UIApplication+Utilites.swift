//
//  UIApplication+Utilites.swift
//  CommonUtilities
//
//  Created by Praveen Sitaraman on 7/25/17.
//  Copyright © 2017 Praveen Sitaraman. All rights reserved.
//

import UIKit

extension UIApplication {
    static func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        // tab
        if let tabController = controller as? UITabBarController, let selectedController = tabController.selectedViewController {
            return topViewController(controller: selectedController)
        }
        
        // nav
        if let navigationController = controller as? UINavigationController, let visibleContoller = navigationController.visibleViewController {
            return topViewController(controller: visibleContoller)
        }
        
        // modal
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        
        return controller
    }
}
