import XCTest

class DAKTests: XCTestCase {
    var dataElement: DAK!
    
    override func setUp() {
        super.setUp()

        dataElement = DAK("43212")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
