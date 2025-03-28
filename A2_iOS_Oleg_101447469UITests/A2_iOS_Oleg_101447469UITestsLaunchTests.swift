//
//  A2_iOS_Oleg_101447469UITestsLaunchTests.swift
//  A2_iOS_Oleg_101447469UITests
//
//  Created by Nadia Rukhlia on 2025-03-28.
//

import XCTest

final class A2_iOS_Oleg_101447469UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
