import XCTest

class DADTests: XCTestCase {
    var dataElement: DAD!
    
    override func setUp() {
        super.setUp()
        
        dataElement = DAD("BRANDON")
    }
    
    override func tearDown() {
        dataElement = nil
        
        super.tearDown()
    }
    
    func testFormat() {
        XCTAssertEqual(dataElement.format(), "DADBRANDON")
    }
}
