//
//  iOSUnitTestExampleUITests.swift
//  iOSUnitTestExampleUITests
//
//  Created by Phạm Như Vũ on 5/21/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import XCTest

class iOSUnitTestExampleUITests: XCTestCase {
    
    var tfEmail: XCUIElement!
    var tfPassword: XCUIElement!
    var btnLogin: XCUIElement!
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        let app = XCUIApplication()
        tfEmail = app.textFields["tfEmail"]
        tfPassword = app.textFields["tfPassword"]
        btnLogin = app.buttons["btnLogin"]
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        checkLoginFail(typeEmail: "", typePassword: "",
                   exceptedEmail: "Empty Email", exceptedPassword: "Empty Password")
        
        checkLoginFail(typeEmail: "", typePassword: "12345",
                   exceptedEmail: "Empty Email", exceptedPassword: "Empty Password")
        
        checkLoginFail(typeEmail: "phamnhuvu.ou", typePassword: "",
                   exceptedEmail: "Empty Email", exceptedPassword: "Empty Password")
        
        checkLoginFail(typeEmail: "phamnhuvu.ou@", typePassword: "1341",
                   exceptedEmail: "Empty Email", exceptedPassword: "Empty Password")
        
        checkLoginSuccess()
    }
    
    func checkLoginFail(typeEmail: String, typePassword: String,
                    exceptedEmail: String, exceptedPassword: String) {
        tfEmail.tap()
        tfEmail.typeText(typeEmail)
        tfPassword.tap()
        tfPassword.typeText(typePassword)
        btnLogin.tap()
    }
    
    func checkLoginSuccess() {
        tfEmail.tap()
        tfEmail.typeText("phamnhuvu.ou@gmail.com")
        tfPassword.tap()
        tfPassword.typeText("123456")
        btnLogin.tap()
    }
    
}
