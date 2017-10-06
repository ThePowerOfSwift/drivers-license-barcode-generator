import XCTest

class DAUTests: XCTestCase {
    func testFormat() {
        let dataElement = DAU(70)
        
        XCTAssertEqual(dataElement.format(), "DAU70 IN")
    }
}
