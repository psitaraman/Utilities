//
//  Thread+UtilitesTests.swift
//  CommonUtilities
//
//  Created by Praveen Sitaraman on 6/14/17.
//  Copyright © 2017 Praveen Sitaraman. All rights reserved.
//

import XCTest

import XCTest
@testable import CommonUtilities

final class Thread_UtilitesTests: CommonTest {
    
    // MARK: - Main Thread Tests
    func testExecuteOnMainThreadFromMain() {
        // force on main thread before executing test
        DispatchQueue.main.async {
            self.executeMainThreadTest()
        }
    }
    
    func testExecuteOnMainThreadFromBackground() {
        // force on background thread before executing test
        DispatchQueue.global(qos: .default).async {
            self.executeMainThreadTest()
        }
    }
    
    // MARK: - Background Thread Tests
    
    func testSyncBackgroundThreadBackgroundQoS() {
        self.executeBackgroundThread(qos: .background, isAsync: false)
    }
    
    func testAsyncBackgroundThreadBackgroundQoS() {
        self.executeBackgroundThread(qos: .background, isAsync: true)
    }
    
    func testSyncBackgroundThreadUtilityQoS() {
        self.executeBackgroundThread(qos: .utility, isAsync: false)
    }
    
    func testAsyncBackgroundThreadUtilityQoS() {
        self.executeBackgroundThread(qos: .utility, isAsync: true)
    }
    
    func testSyncBackgroundThreadDefaultQoS() {
        self.executeBackgroundThread(qos: .default, isAsync: false)
    }
    
    func testAsyncBackgroundThreadDefaultQoS() {
        self.executeBackgroundThread(qos: .default, isAsync: true)
    }
    
    func testSyncBackgroundThreadUserInitatedQoS() {
        self.executeBackgroundThread(qos: .userInitiated, isAsync: false)
    }
    
    func testAsyncBackgroundThreadUserInitatedQoS() {
        self.executeBackgroundThread(qos: .userInitiated, isAsync: true)
    }
    
    func testSyncBackgroundThreadUserInteractiveQoS() {
        self.executeBackgroundThread(qos: .userInteractive, isAsync: false)
    }
    
    func testAsyncBackgroundThreadUserInteractiveQoS() {
        self.executeBackgroundThread(qos: .userInteractive, isAsync: true)
    }
    
    func testSyncBackgroundThreadUnspecifiedQoS() {
        self.executeBackgroundThread(qos: .unspecified, isAsync: false)
    }
    
    func testAsyncBackgroundThreadUnspecifiedQoS() {
        self.executeBackgroundThread(qos: .unspecified, isAsync: true)
    }
    
    func testSyncBackgroundThreadBackgroundQoSFromBackground() {
        self.executeBackgroundThread(qos: .background, isAsync: false, executeFromMainThread: false)
    }
    
    func testAsyncBackgroundThreadBackgroundQoSFromBackground() {
        self.executeBackgroundThread(qos: .background, isAsync: true, executeFromMainThread: false)
    }
    
    func testSyncBackgroundThreadUtilityQoSFromBackground() {
        self.executeBackgroundThread(qos: .utility, isAsync: false, executeFromMainThread: false)
    }
    
    func testAsyncBackgroundThreadUtilityQoSFromBackground() {
        self.executeBackgroundThread(qos: .utility, isAsync: true, executeFromMainThread: false)
    }
    
    func testSyncBackgroundThreadDefaultQoSFromBackground() {
        self.executeBackgroundThread(qos: .default, isAsync: false, executeFromMainThread: false)
    }
    
    func testAsyncBackgroundThreadDefaultQoSFromBackground() {
        self.executeBackgroundThread(qos: .default, isAsync: true, executeFromMainThread: false)
    }
    
    func testSyncBackgroundThreadUserInitatedQoSFromBackground() {
        self.executeBackgroundThread(qos: .userInitiated, isAsync: false, executeFromMainThread: false)
    }
    
    func testAsyncBackgroundThreadUserInitatedQoSFromBackground() {
        self.executeBackgroundThread(qos: .userInitiated, isAsync: true, executeFromMainThread: false)
    }
    
    func testSyncBackgroundThreadUserInteractiveQoSFromBackground() {
        self.executeBackgroundThread(qos: .userInteractive, isAsync: false, executeFromMainThread: false)
    }
    
    func testAsyncBackgroundThreadUserInteractiveQoSFromBackground() {
        self.executeBackgroundThread(qos: .userInteractive, isAsync: true, executeFromMainThread: false)
    }
    
    func testSyncBackgroundThreadUnspecifiedQoSFromBackground() {
        self.executeBackgroundThread(qos: .unspecified, isAsync: false, executeFromMainThread: false)
    }
    
    func testAsyncBackgroundThreadUnspecifiedQoSFromBackground() {
        self.executeBackgroundThread(qos: .unspecified, isAsync: true, executeFromMainThread: false)
    }
    
    // MARK: Performance Tests
    
    func testExecuteOnMainThreadFromMainPerformance() {
        self.measure { [weak self] in
            self?.testExecuteOnMainThreadFromMain()
        }
    }
    
    func testExecuteOnMainThreadFromBackgroundPerformance() {
        self.measure { [weak self] in
            self?.testExecuteOnMainThreadFromBackground()
        }
    }
    
    func testAsyncBackgroundThreadBackgroundQoSPerformance() {
        self.measure { [weak self] in
            self?.testAsyncBackgroundThreadBackgroundQoS()
        }
    }
    
    func testAsyncBackgroundThreadUtilityQoSPerformance() {
        self.measure { [weak self] in
            self?.testAsyncBackgroundThreadUtilityQoS()
        }
    }
    
    func testAsyncBackgroundThreadDefaultQoSPerformance() {
        self.measure { [weak self] in
            self?.testAsyncBackgroundThreadDefaultQoS()
        }
    }
    func testAsyncBackgroundThreadUserInitatedQoSPerformance() {
        self.measure { [weak self] in
            self?.testAsyncBackgroundThreadUserInitatedQoS()
        }
    }
    
    func testAsyncBackgroundThreadUserInteractiveQoSPerformance() {
        self.measure { [weak self] in
            self?.testAsyncBackgroundThreadUserInteractiveQoS()
        }
    }
    
    func testAsyncBackgroundThreadUnspecifiedQoSPerformance() {
        self.measure { [weak self] in
            self?.testAsyncBackgroundThreadUnspecifiedQoS()
        }
    }
    
    func testAsyncBackgroundThreadBackgroundQoSFromBackgroundPerformance() {
        self.measure { [weak self] in
            self?.testAsyncBackgroundThreadBackgroundQoSFromBackground()
        }
    }
    
    func testAsyncBackgroundThreadUtilityQoSFromBackgroundPerformance() {
        self.measure { [weak self] in
            self?.testAsyncBackgroundThreadUtilityQoSFromBackground()
        }
    }
    
    func testAsyncBackgroundThreadDefaultQoSFromBackgroundPerformance() {
        self.measure { [weak self] in
            self?.testAsyncBackgroundThreadDefaultQoSFromBackground()
        }
    }
    
    func testAsyncBackgroundThreadUserInitatedQoSFromBackgroundPerformance() {
        self.measure { [weak self] in
            self?.testAsyncBackgroundThreadUserInitatedQoSFromBackground()
        }
    }
    
    func testAsyncBackgroundThreadUserInteractiveQoSFromBackgroundPerformance() {
        self.measure { [weak self] in
            self?.testAsyncBackgroundThreadUserInteractiveQoSFromBackground()
        }
    }
    
    func testAsyncBackgroundThreadUnspecifiedQoSFromBackgroundPerformance() {
        self.measure { [weak self] in
            self?.testAsyncBackgroundThreadUnspecifiedQoSFromBackground()
        }
    }
    
    // MARK: - Private
    
    private func executeBackgroundThread(qos: DispatchQoS.QoSClass, isAsync: Bool, executeFromMainThread: Bool = true) {
        
        let block = {
            Thread.executeOnBackgroundThread(qos: qos, isAsynchronous: isAsync) {
                if isAsync { XCTAssert(!Thread.isMainThread, "Execution is NOT on BACKGROUND thread") }
                self.longRunningProcess()
            }
        }
        
        guard executeFromMainThread else {
            DispatchQueue.global(qos: .default).async {
                block()
            }
            return
        }
        
        DispatchQueue.main.async {
            block()
        }
    }
    
    private func executeMainThreadTest() {
        Thread.executeOnMainThread {
            XCTAssert(Thread.isMainThread, "Execution is NOT on MAIN thread")
            self.longRunningProcess()
        }
    }
    
    private func longRunningProcess() {
        for i in 1...1000000 {
            _ = 1 + i
        }
    }
}

