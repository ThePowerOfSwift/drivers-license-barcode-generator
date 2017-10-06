import XCTest

class DBCTests: XCTestCase {
    var dataElement: DBC!
    
    override func setUp() {
        super.setUp()

        dataElement = DBC(.Male)
    }
    
    override func tearDown() {
        dataElement = nil
        
        super.tearDown()
    }
    
    func testFormat() {
        XCTAssertEqual(dataElement.format(), "DBC1")
    }
}


