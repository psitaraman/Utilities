//
//  ThreadSafeValueTests.swift
//  CommonUtilities
//
//  Created by Praveen Sitaraman on 7/18/17.
//  Copyright © 2017 Praveen Sitaraman. All rights reserved.
//

import XCTest
@testable import CommonUtilities

final class ThreadSafeValueTests: CommonTest {
    
    // MARK: - Properties
    
    private var mockValueType: ValueType!
    private var mockReferenceType: ReferenceType!
    private var mockSafeValueType: ThreadSafeValue<ValueType>!
    private var mockSafeReferenceType: ThreadSafeValue<ReferenceType>!
    
    // MARK: - Lifecycles
    
    override func setUp() {
        super.setUp()
        
        self.mockValueType = ValueType(name: "John", age: 23, favorites: ["reading", "swimming", "gaming"])
        self.mockReferenceType = ReferenceType(name: "Jane", age: 25, favorites: ["tennis", "music", "driving"])
        
        self.mockSafeValueType = ThreadSafeValue(self.mockValueType, identifier: "valueType")
        self.mockSafeReferenceType = ThreadSafeValue(self.mockReferenceType, identifier: "referenceType")

    }
    
    // MARK: - Tests
    
    func testReadWrite() {
        //RRWRRW
        self.read()
        self.read()
        self.write(valueType: ValueType(name: "George", age: 245, favorites: ["fishing", "sleeping"]), referenceType: ReferenceType(name: "Chris", age: 86, favorites: ["drawing", "bridge"]))
        self.read()
        self.read()
        self.write(valueType: ValueType(name: "Fred", age: 123, favorites: ["Programming", "Bowling"]), referenceType: ReferenceType(name: "Barney", age: 63, favorites: ["Programming", "Bowling"]))
    }
    
    // MARK: - Private
    private func read() {
        _ = self.mockSafeValueType.value
        _ = self.mockSafeReferenceType.value
    }
    
    private func write(valueType: ValueType, referenceType: ReferenceType) {
        
        XCTAssertNotEqual(self.mockSafeValueType.value, valueType, "ValueType should NOT be equal before write")
        XCTAssertNotEqual(self.mockSafeReferenceType.value, referenceType, "ReferenceType should NOT be equal before write")
        
        self.mockSafeValueType.value = valueType
        self.mockSafeReferenceType.value = referenceType
        
        XCTAssertEqual(self.mockSafeValueType.value, valueType, "ValueType should be equal after write")
        XCTAssertEqual(self.mockSafeReferenceType.value, referenceType, "ReferenceType should be equal after write")
    }
}

fileprivate struct ValueType {
    let name: String
    let age: Int
    let favorites: [String]
}

fileprivate final class ReferenceType {
    let name: String
    let age: Int
    let favorites: [String]
    
    init(name: String, age: Int, favorites: [String]) {
        self.name = name
        self.age = age
        self.favorites = favorites
    }
}

extension ValueType: Equatable {
    public static func ==(lhs: ValueType, rhs: ValueType) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age && lhs.favorites == rhs.favorites
    }
}

extension ReferenceType: Equatable {
    public static func ==(lhs: ReferenceType, rhs: ReferenceType) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age && lhs.favorites == rhs.favorites
    }
}
