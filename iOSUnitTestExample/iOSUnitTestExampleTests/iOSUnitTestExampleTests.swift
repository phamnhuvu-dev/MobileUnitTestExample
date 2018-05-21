//
//  iOSUnitTestSampleTests.swift
//  iOSUnitTestSampleTests
//
//  Created by Phạm Như Vũ on 5/19/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import XCTest
@testable import iOSUnitTestSample

class iOSUnitTestSampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let loginVM = LoginViewModel()
        XCTAssertEqual(loginVM.checkEmail(""), loginVM.EMPTY_EMAIL, "check email")
        
        XCTAssertEqual(loginVM.checkEmail("phamnhuvu.ou@gmail.com"), nil, "check email")
        XCTAssertEqual(loginVM.checkEmail("gmail.com@gmail.com"), nil, "check email")
        XCTAssertEqual(loginVM.checkEmail("phamnhuvu.134@yahoo.com"), nil, "check email")

        XCTAssertEqual(loginVM.checkEmail("_dfafdsa@yahoo"), loginVM.INVALID_EMAIL, "check email")
        XCTAssertEqual(loginVM.checkEmail("phamnhuvu.@yahoo.com"), loginVM.INVALID_EMAIL, "check email")
        XCTAssertEqual(loginVM.checkEmail("1234124789"), loginVM.INVALID_EMAIL, "check email")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
