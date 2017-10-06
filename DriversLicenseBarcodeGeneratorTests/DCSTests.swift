import XCTest

class DCSTests: XCTestCase {
    var dataElement: DCS!
    
    override func setUp() {
        super.setUp()
        
        dataElement = DCS("DECOT")
    }
    
    override func tearDown() {
        dataElement = nil
        
        super.tearDown()
    }
    
    func testFormat() {
        XCTAssertEqual(dataElement.format(), "DCSDECOT")
    }
}
