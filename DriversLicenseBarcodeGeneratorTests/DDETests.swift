import XCTest

class DDETests: XCTestCase {
    func testFormat() {
        let dataElement = DDE(.Yes)
        
        XCTAssertEqual(dataElement.format(), "Y")
    }
}
