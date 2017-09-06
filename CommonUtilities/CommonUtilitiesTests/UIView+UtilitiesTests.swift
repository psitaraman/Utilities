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
//  UIView+UtilitiesTests.swift
//  CommonUtilities
//
//  Created by Praveen Sitaraman on 6/14/17.
//  Copyright © 2017 Praveen Sitaraman. All rights reserved.
//

import XCTest
@testable import CommonUtilities

final class UIView_UtilitiesTests: CommonTest {
    
    private var superView: UIView!
    private var subView: UIView!
    private let topPadding = CGFloat(10)
    private let bottomPadding = CGFloat(-20)
    private let leftPadding = CGFloat(8)
    private let rightPadding = CGFloat(-2)
    
    override func setUp() {
        super.setUp()
        
        self.superView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
        self.subView = UIView()
    }
    
    func testFillWithView() {
        
        let boundaries = self.superView.bounds
        let xMin = boundaries.origin.x
        let xMax = boundaries.origin.x + boundaries.height
        let yMin = boundaries.origin.y
        let yMax = boundaries.origin.y + boundaries.width
        
        XCTAssert(!self.superView.subviews.contains(subView), "Subview is already contained in superview")
        XCTAssert(!self.subView.subviews.contains(superView), "Illegal view hierarchy, subview should not contain superview")
        
        // make sure padding does NOT move subview outside the bounds of the superview
        XCTAssert(xMin+self.topPadding >= xMin, "Top Padding moves subview above superview")
        XCTAssert(xMin+self.topPadding <= xMax, "Top Padding moves subview below superview")
        XCTAssert(xMax+self.bottomPadding >= xMin, "Bottom Padding moves subview above superview")
        XCTAssert(xMax+self.bottomPadding <= xMax, "Bottom Padding moves subview below superview")
        XCTAssert(yMin+self.leftPadding >= yMin, "Left Padding moves subview to the left of superview")
        XCTAssert(yMin+self.leftPadding <= yMax, "Left Padding moves subview to the right of superview")
        XCTAssert(yMax+self.rightPadding >= yMin, "Right Padding moves subview to the left of superview")
        XCTAssert(yMax+self.rightPadding <= yMax, "Right Padding moves subview to the right of superview")
        
        self.superView.fillWithView(self.subView, topPadding: self.topPadding, bottomPadding: self.bottomPadding, leadingPadding: self.leftPadding, trailingPadding: self.rightPadding)
    }
}
