import XCTest

class DBDTests: XCTestCase {
    var dataElement: DBD!
    
    override func setUp() {
        super.setUp()

        let calendar = NSCalendar.current

        var dateComponents = DateComponents()
        dateComponents.year = 2015
        dateComponents.month = 10
        dateComponents.day = 3

        let documentIssueDate = calendar.date(from: dateComponents as DateComponents)!
        
        dataElement = DBD(documentIssueDate)
    }
    
    override func tearDown() {
        dataElement = nil
        
        super.tearDown()
    }
    
    func testFormat() {
        XCTAssertEqual(dataElement.format(), "DBD10032015")
    }
}
