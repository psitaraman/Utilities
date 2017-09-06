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
