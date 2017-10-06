import XCTest

class HeaderTests: XCTestCase {
    func testDescription() {
        let expected = """
        @
        
        ANSI 123456789
        """
        
        let header = Header(issuerIdentificationNumber: "1234", AAMVAVersionNumber: "56", jurisdictionVersionNumber: "78", numberOfEntries: "9")
        
        XCTAssertEqual(header.description, expected)
    }
}
