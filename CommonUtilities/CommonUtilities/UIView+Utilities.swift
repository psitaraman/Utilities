//
//  UIView+Utilities.swift
//  CommonUtilities
//
//  Created by Praveen Sitaraman on 6/5/17.
//  Copyright © 2017 Praveen Sitaraman. All rights reserved.
//

import UIKit

extension UIView {
    
    func fillWithView(_ subView: UIView, topPadding: CGFloat = 0.0, bottomPadding: CGFloat = 0.0, leadingPadding: CGFloat = 0.0, trailingPadding: CGFloat = 0.0) {
        
        // exit out if re-adding subview to superview
        guard !self.subviews.contains(subView) else { return }
        
        subView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subView)
        
        let topConstraint = NSLayoutConstraint(item: subView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0 + topPadding)
        let bottomConstraint = NSLayoutConstraint(item: subView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0 + bottomPadding)
        
        let leadingConstraint = NSLayoutConstraint(item: subView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0 + leadingPadding)
        let trailingConstraint = NSLayoutConstraint(item: subView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0 + trailingPadding)
        
        self.addConstraints([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
    }
}
