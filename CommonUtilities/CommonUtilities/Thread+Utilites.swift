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
//  Thread+Utilites.swift
//  CommonUtilities
//
//  Created by Praveen Sitaraman on 6/8/17.
//  Copyright © 2017 Praveen Sitaraman. All rights reserved.
//

import Foundation

extension Thread {
    
    /**
     Executes code block on main thread
     - parameter block: escaping block of code to be executed
     */
    static func executeOnMainThread(block: @escaping () -> ()) {
        
        guard !Thread.isMainThread else {
            block()
            return
        }
        
        DispatchQueue.main.async {
            block()
        }
    }
    
    /**
     Executes code block on background thread
     - parameter qos: quality of service level, defaults to .default
     - parameter isAsynchronous: indicates whether to execute code block synchronously or asynchronously, defaults to bool true which means the block, by default, is executed asynchronously
     - parameter block: escaping block of code to be executed
     */
    static func executeOnBackgroundThread(qos: DispatchQoS.QoSClass = .default, isAsynchronous: Bool = true, block: @escaping () -> ()) {
        
        Thread.executeOnMainThread {
            guard isAsynchronous else {
                
                DispatchQueue.global(qos: qos).sync {
                    block()
                }
                return
            }
            
            DispatchQueue.global(qos: qos).async {
                block()
            }
        }
    }
}
