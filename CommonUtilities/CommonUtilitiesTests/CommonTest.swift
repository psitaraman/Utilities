//
//  CommonTest.swift
//  CommonUtilities
//
//  Created by Praveen Sitaraman on 6/15/17.
//  Copyright © 2017 Praveen Sitaraman. All rights reserved.
//

import XCTest

class CommonTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // stop within test case after first assertion failure
        self.continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
        // continue executing other test cases even if current test case failed
        self.continueAfterFailure = true
    }
}


