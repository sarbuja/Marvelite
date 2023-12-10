//
//  CleanMarveliteUITests.swift
//  CleanMarveliteUITests
//
//  Created by Santa Gurung on 02/01/2021.
//

import XCTest

class CleanMarveliteUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        XCUIApplication().launch()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHomeScreen() throws {
        app = XCUIApplication()
        
        app.tabBars.buttons.element(boundBy: 0).tap()
        
        XCTAssertTrue(app.staticTexts["TopLabel"].label == "Characters")
        XCTAssertTrue(app.staticTexts["BottomLabel"].label == "Comics")
    }

    func testCollectionViewCellLabels() {
        app = XCUIApplication()
        
        let label = app.staticTexts.element(matching: .staticText, identifier: "CharacterLabel")
        let predicate = NSPredicate(format: "exists == 1")
        let expectation = expectation(for: predicate, evaluatedWith: label)
        
        let result = XCTWaiter.wait(for: [expectation], timeout: 2.0)
        XCTAssertEqual(result, .completed)
        
        XCTAssertTrue(app.staticTexts["ComicsLabel"].exists)
        XCTAssertTrue(app.staticTexts["ComicsPrice"].exists)
    }
    
    func testCharacterDetailForFirstCell() {
        app = XCUIApplication()
        
        let firstCell = app.collectionViews.children(matching: .any).element(boundBy: 0)
        let cellText = app.staticTexts["CharacterLabel"].firstMatch.title
        firstCell.tap()
        
        XCTAssertTrue(cellText == app.navigationBars.element.title)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
