//
//  RegexTests.swift
//  BuscadorTests
//
//  Created by Gustavo Cosme on 26/12/21.
//

import XCTest

class RegexTests: XCTestCase {

    func test_regex_parcel() {
        let testString = "AA123456789BR"
        let match = NSRegularExpression.match(text: testString, regex: .parcel)
        XCTAssertEqual(match, true)
    }
    
    func test_regex_parcel_error_1() {
        let testString = "AA123456789BRoiuqrowoieyrw"
        let match = NSRegularExpression.match(text: testString, regex: .parcel)
        XCTAssertEqual(match, false)
    }
    
    func test_regex_parcel_error_2() {
        let testString = ""
        let match = NSRegularExpression.match(text: testString, regex: .parcel)
        XCTAssertEqual(match, false)
    }
    
    func test_regex_parcel_error_3() {
        let testString = "AA123456789"
        let match = NSRegularExpression.match(text: testString, regex: .parcel)
        XCTAssertEqual(match, false)
    }
}
