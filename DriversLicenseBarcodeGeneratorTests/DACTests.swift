import XCTest

class DACTests: XCTestCase {
    var dataElement: DAC!
    
    override func setUp() {
        super.setUp()
        
        dataElement = DAC("KYLE")
    }
    
    override func tearDown() {
        dataElement = nil
        
        super.tearDown()
    }
    
    func testFormat() {
        XCTAssertEqual(dataElement.format(), "DACKYLE")
    }
}
