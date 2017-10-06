import XCTest

class DataElementLengthTypeTests: XCTestCase {
    func testLength() {
        let lengthType = DataElementLengthType("F2A")
        
        XCTAssertEqual(lengthType.length, 2)
    }
}
