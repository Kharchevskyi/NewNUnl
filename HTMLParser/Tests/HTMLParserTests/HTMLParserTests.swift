import XCTest
@testable import HTMLParser

final class HTMLParserTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(HTMLParser().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
