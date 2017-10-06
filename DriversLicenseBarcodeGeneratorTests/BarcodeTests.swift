//
//  DriversLicenseBarcodeGeneratorTests.swift
//  DriversLicenseBarcodeGeneratorTests
//
//  Created by Kyle Decot on 10/5/17.
//  Copyright © 2017 Kyle Decot. All rights reserved.
//

import XCTest
@testable import DriversLicenseBarcodeGenerator

class BarcodeTests: XCTestCase {
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
    
    func testAAMVAVersionNumber() {
        XCTAssertEqual(Barcode.AAMVAVersionNumber, "08")
    }
    
    func testJurisdictionVersionNumber() {
        XCTAssertEqual(Barcode.jurisdictionVersionNumber, "00")
    }
    
    func testDescription() {
        let barcode = Barcode(dataElements: [
            DCS("KYLE"),
            DAU(70),
        ])
        
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
}

