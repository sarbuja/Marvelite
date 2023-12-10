//
//  CleanMarveliteTests.swift
//  CleanMarveliteTests
//
//  Created by Santa Gurung on 02/01/2021.
//

import XCTest
@testable import CleanMarvelite

class CleanMarveliteAPITests: XCTestCase {

    var sut: URLSession!
    
    override func setUpWithError() throws {
        sut = URLSession(configuration: .default)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
}
