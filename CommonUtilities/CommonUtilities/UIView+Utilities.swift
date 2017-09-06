/*
 MIT License
 
 Copyright (c) 2017 Praveen Sitaraman
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */
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
