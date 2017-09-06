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
//  ThreadSafeValue.swift
//  CommonUtilities
//
//  Created by Praveen Sitaraman on 7/17/17.
//  Copyright © 2017 Praveen Sitaraman. All rights reserved.
//

import Foundation

/**
 Defines thread safe read-write behavior where reads are concurrent and return synchronously. Writes are serial and return asynchronously.
 - parameters:
    - identifer: unique identifer that defines the unique queue used to make reads and writes thread safe for the unsafe value
    - value: value that is desired to be read and written in a thread safe mannner
 */
final class ThreadSafeValue<T> {
    
    // MARK: - Properties
    
    private var unsafeValue: T
    private let identifier: String
    private let queue: DispatchQueue
    
    /// set and get thread safe value
    var value: T {
        // read
        get {
            var val: T?
            self.queue.sync {
                val = self.unsafeValue
            }
            return val!
        }
        
        // write
        set {
            self.queue.async(flags: .barrier) {[weak self] in
                self?.unsafeValue = newValue
            }
        }
    }
    
    // MARK: - Lifecycle
    
    init(_ value: T, identifier: String) {
        self.unsafeValue = value
        self.identifier = identifier
        
        self.queue = DispatchQueue(label: "queue_\(self.identifier)", attributes: .concurrent)
    }
}
