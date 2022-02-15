//
//  MockingDemoUITests.swift
//  MockingDemoUITests
//
//  Created by Viacheslav Dulnev on 04.02.2022.
//

import XCTest

class MockingDemoUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUp() {
        // UI tests must launch the application that they test.
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchEnvironment = ["ENV" : "TEST"]
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMissingData() throws {

        let userNameTextField = app.textFields["usernameTextField"]
        userNameTextField.tap()
        userNameTextField.typeText("")
        
        let passwordTextField = app.textFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        
        let messageText = app.staticTexts["messageText"]
        XCTAssertEqual(messageText.label, "Required fields are missing")
    }
    
    func testLogin() {
        let userNameTextField = app.textFields["usernameTextField"]
                userNameTextField.tap()
                userNameTextField.typeText("user")

                let passwordTextField = app.textFields["passwordTextField"]
                passwordTextField.tap()
                passwordTextField.typeText("pwd")

                let loginButton = app.buttons["loginButton"]
                loginButton.tap()

        let dashboardTitle = app.staticTexts["Dashboard"]
        XCTAssertTrue(dashboardTitle.waitForExistence(timeout: 0.5))
    }
    
    func testInvalidLogin() {
        let userNameTextField = app.textFields["usernameTextField"]
                userNameTextField.tap()
                userNameTextField.typeText("user")

                let passwordTextField = app.textFields["passwordTextField"]
                passwordTextField.tap()
                passwordTextField.typeText("pwd1")

                let loginButton = app.buttons["loginButton"]
                loginButton.tap()

        let messageText = app.staticTexts["messageText"]
        XCTAssertEqual(messageText.label, "Invalid credentials")
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
