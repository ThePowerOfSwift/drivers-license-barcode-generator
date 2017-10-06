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
        XCTAssertEqual(Encoder.complianceIndicator, "\u{40}");
    }
    
    func testDataElementSeparator() {
        XCTAssertEqual(Encoder.dataElementSeparator, "\u{0A}");
    }
    
    func testRecordSeparator() {
        XCTAssertEqual(Encoder.recordSeparator, "\u{1E}")
    }
    
    func testSegmentSeparator() {
        XCTAssertEqual(Encoder.segmentSeparator, "\u{0D}")
    }
    
    func testFileType() {
        XCTAssertEqual(Encoder.fileType, "ANSI ")
    }
    
    func testAAMVAVersionNumber() {
        XCTAssertEqual(Encoder.AAMVAVersionNumber, "08")
    }
    
    func testJurisdictionVersionNumber() {
        XCTAssertEqual(Encoder.jurisdictionVersionNumber, "00")
    }
    
    func testDescription() {
        let barcode = Barcode()
    }
}

