import XCTest

class DCGTests: XCTestCase {
    func testFormat() {
        let dataElement = DCG(.US)
        
        XCTAssertEqual(dataElement.format(), "DCGUSA")
    }
}
