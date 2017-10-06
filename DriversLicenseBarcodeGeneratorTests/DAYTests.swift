import XCTest

class DAYTests: XCTestCase {
    var dataElement: DAY!
    
    override func setUp() {
        super.setUp()
        
        dataElement = DAY(.Hazel)
    }
    
    override func tearDown() {
        dataElement = nil
        
        super.tearDown()
    }
    
    func testFormat() {
        XCTAssertEqual(dataElement.format(), "DAYHAZ")
    }
}



