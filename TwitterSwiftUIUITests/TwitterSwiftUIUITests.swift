//
//  TwitterSwiftUIUITests.swift
//  TwitterSwiftUIUITests
//
//  Created by Clifton Theodore on 13/6/2022.
//

import XCTest
import EyesXCUI

@testable import TwitterSwiftUI

class TwitterSwiftUIUITests: XCTestCase {
    
    func testTest() {
        // Initialize the eyes SDK and set your private API key.
        let eyes = Eyes()
        eyes.apiKey = ""
        
        let app = XCUIApplication()
        
        app.launch()
        
        // Start the test.
        eyes.open(withApplicationName: "App Demo V3", testName: "Login V2")
        
        let email = app.textFields["Email"]
        let password = app.secureTextFields["Password"]
        
        email.tap()
        email.typeText("test@test.com")
        password.tap()
        password.typeText("test123")
        
        // Visual checkpoint #1. -> Please not statusBarExists True will disable it from being screenshotted
        eyes.check(withTag: "loginView", andSettings: Target.window().statusBarExists(true).timeout(inSeconds: 3))
        
        // End the test.
        do {
            try eyes.close()
            app.navigationBars["Home"].buttons["SideBar"].tap()
            app.buttons["Logout"].tap()
        } catch {
            eyes.abortIfNotClosed()
        }
    }
    
    func testLogin() {
        // Initialize the eyes SDK and set your private API key.
        let eyes = Eyes()
        eyes.apiKey = ""
        
        let app = XCUIApplication()
        let email = app.textFields["Email"]
        let password = app.secureTextFields["Password"]
        
        app.launch()
    
        // Start the test.
        eyes.open(withApplicationName: "App Demo V2", testName: "Login")
        
        email.tap()
        email.typeText("test@test.com")
        password.tap()
        password.typeText("test123")
    
        // Visual checkpoint #1. -> Please not statusBarExists True will disable it from being screenshotted
        eyes.check(withTag: "loginView", andSettings: Target.window().statusBarExists(true).timeout(inSeconds: 3))
                
        app.buttons["Sign In"].tap()
        
        // End the test.
        do {
            try eyes.close()
            app.navigationBars["Home"].buttons["SideBar"].tap()
            app.buttons["Logout"].tap()
        } catch {
            eyes.abortIfNotClosed()
        }
    }
    
    func testNewTweet() throws {
        // Initialize the eyes SDK and set your private API key.
        let eyes = Eyes()
        eyes.apiKey = ""
        
        let app = XCUIApplication()
        let email = app.textFields["Email"]
        let password = app.secureTextFields["Password"]
        
        app.launch()
        
        // Start the test.
        eyes.open(withApplicationName: "App Demo V2", testName: "New Tweet")
        
        email.tap()
        email.typeText("test123@test.com")

        password.tap()
        password.typeText("Test123")
        sleep(3)
        app.buttons["Sign In"].tap()
        
        // Visual checkpoint #1. -> Please not statusBarExists True will disable it from being screenshotted
        eyes.check(withTag: "mainInterfaceView", andSettings: Target.window().statusBarExists(true).timeout(inSeconds: 3))
        
        let tweetButton = app.buttons["tweet"]
        tweetButton.tap()
        
        eyes.check(withTag: "New Tweet View", andSettings: Target.window().statusBarExists(true).timeout(inSeconds: 3))
        
        let cancelButton = app.buttons["Cancel"]
        cancelButton.tap()
                                
        // End the test.
        do {
            try eyes.close()
            app.navigationBars["Home"].buttons["SideBar"].tap()
            app.buttons["Logout"].tap()
        } catch {
            eyes.abortIfNotClosed()
        }
        
    }
        
    func testSideMenuProfileLink() throws {
        // Initialize the eyes SDK and set your private API key.
        let eyes = Eyes()
        eyes.apiKey = ""
        
        let app = XCUIApplication()
        let email = app.textFields["Email"]
        let password = app.secureTextFields["Password"]
        
        app.launch()
        
        // Start the test.
        eyes.open(withApplicationName: "App Demo V2", testName: "SideMenu & Profile")
        
        email.tap()
        email.typeText("test@test.com")
        password.tap()
        password.typeText("test123")
        
        sleep(3)
        app.buttons["Sign In"].tap()
        
        // Visual checkpoint #1. -> Please not statusBarExists True will disable it from being screenshotted
        eyes.check(withTag: "mainInterfaceView", andSettings: Target.window().statusBarExists(true).timeout(inSeconds: 3))

        app.navigationBars["Home"].buttons["SideBar"].tap()
    
        // Visual checkpoint #2.
        eyes.check(withTag: "Side Menu", andSettings: Target.window().timeout(inSeconds: 3))
        
        app.buttons["Profile"].tap()
        
        // Visual checkpoint #3.
        eyes.check(withTag: "Profile View", andSettings: Target.window().timeout(inSeconds: 5))
        
        app.buttons.firstMatch.tap()
        
        // End the test.
        do {
            try eyes.close()
            app.navigationBars["Home"].buttons["SideBar"].tap()
            app.buttons["Logout"].tap()
        } catch {
            eyes.abortIfNotClosed()
        }
    }
}
