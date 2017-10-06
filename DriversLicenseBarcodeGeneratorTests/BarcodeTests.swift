import XCTest
@testable import DriversLicenseBarcodeGenerator

class BarcodeTests: XCTestCase {
    let jurisdictionSpecificVehicleClass = DCA("D")
    let jurisdictionSpecificRestrictionCodes = DCB("A")
    let jurisdictionSpecificEndorsementCodes = DCD("NONE")
    let documentExpirationDate = DBA(buildDate(year: 2019, month: 9, day: 14))
    let customerFamilyName = DCS("DECOT")
    let customerFirstName = DAC("KYLE")
    let customerMiddleNames = DAD(["BRANDON"])
    let documentIssueDate = DBD(buildDate(year: 2015, month: 10, day: 3))
    let dateOfBirth = DBB(buildDate(year: 1986, month: 9, day: 14))
    let physicalDescriptionSex = DBC(.Male)
    let physicalDescriptionEyeColor = DAY(.Hazel)
    
    func testComplianceIndicator() {
        XCTAssertEqual(Barcode.complianceIndicator, "\u{40}");
    }
    
    func testDataElementSeparator() {
        XCTAssertEqual(Barcode.dataElementSeparator, "\u{0A}");
    }
    
    func testRecordSeparator() {
        XCTAssertEqual(Barcode.recordSeparator, "\u{1E}")
    }
    
    func testSegmentSeparator() {
        XCTAssertEqual(Barcode.segmentSeparator, "\u{0D}")
    }
    
    func testFileType() {
        XCTAssertEqual(Barcode.fileType, "ANSI ")
    }
    
    func testDescription() {
//        DCS("DECOT"),
//        customerFirstName,
//        DAD("BRANDON"),
//        DBD(buildDate(year: 2015, month: 10, day: 3)),
//        ,
//        DBC(.Male),
//        DAY(.Hazel),
//        DAU(70)
        
        let barcode = Barcode(dataElements: [
            jurisdictionSpecificVehicleClass,
            jurisdictionSpecificRestrictionCodes,
            jurisdictionSpecificEndorsementCodes,
            documentExpirationDate,
            customerFamilyName,
            customerFirstName,
            customerMiddleNames,
            physicalDescriptionSex,
            physicalDescriptionEyeColor
            ], issuerIdentificationNumber: "636000", AAMVAVersionNumber: "00", jurisdictionVersionNumber: "00")
        
        let expected = """
        @

        ANSI 636023080102DL00410279ZO03200024DLDBA09142019
        DCSDECOT
        DACKYLE
        DADBRANDON
        DBD10032015
        DBB09141986
        DBC1
        DAYHAZ
        DAU070 IN
        DAG1437 CHESAPEAKE AVE
        DAICOLUMBUS
        DAJOH
        DAK432122152
        DAQSS430403
        DCF2509UN6813300000
        DCGUSA
        DDEN
        DDFN
        DDGN
        DAZBRO
        DCIUS,OHIO
        DCJNONE
        DCUNONE
        DCE4
        DDAM
        DDB12042013
        DAW170
        DCAD
        DCBA
        DCDNONE
        ZOZOAN
        ZOBN
        ZOE09142019
        """
        
        XCTAssertEqual(barcode.description, expected)
    }
    
    private static func buildDate(year: Int, month: Int, day: Int) -> Date! {
        let calendar = NSCalendar.current

        var dateComponents = DateComponents()
        dateComponents.year = 2019
        dateComponents.month = 9
        dateComponents.day = 14

        return calendar.date(from: dateComponents as DateComponents)!
    }
}

