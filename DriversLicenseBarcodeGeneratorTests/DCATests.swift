import XCTest

class DCATests: XCTestCase {
    func testFormatWithoutTruncation() {
        let dataElement = DCA("D")
        
        XCTAssertEqual(dataElement.format(), "DCAD")
    }

// TODO
//    func testFormatWithTruncation() {
//        let dataElement = DCA("ABCDEFG")
//
//        XCTAssertEqual(dataElement.format(), "DCAABCDEF")
//    }
}

