import XCTest

class DBBTests: XCTestCase {
    var dataElement: DBB!
    
    override func setUp() {
        super.setUp()
        
        let calendar = NSCalendar.current
        
        var dateComponents = DateComponents()
        dateComponents.year = 1986
        dateComponents.month = 9
        dateComponents.day = 14
        
        let dateOfBirth = calendar.date(from: dateComponents as DateComponents)!
        
        dataElement = DBB(dateOfBirth)
    }
    
    override func tearDown() {
        dataElement = nil
        
        super.tearDown()
    }
    
    func testFormat() {
        XCTAssertEqual(dataElement.format(), "DBB09141986")
    }
}

