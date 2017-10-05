//
//  Header.swift
//  DriversLicenseBarcodeGenerator
//
//  Created by Kyle Decot on 10/5/17.
//  Copyright © 2017 Kyle Decot. All rights reserved.
//

import Foundation

class Header {
    static let complianceIndicator = "\u{40}"
    static let dataElementSeparator = "\u{0A}"
    static let recordSeparator = "\u{1E}"
    static let segmentTerminator = "\u{0D}"
    static let fileType = "ANSI "
    
    let issuerIdentificationNumber: String
    let AAMVAVersionNumber: String
    let jurisdictionVersionNumber: String
    let numberOfEntries: String
    
    init(issuerIdentificationNumber: String, AAMVAVersionNumber: String, jurisdictionVersionNumber: String, numberOfEntries: String) {
        self.issuerIdentificationNumber = issuerIdentificationNumber
        self.AAMVAVersionNumber = AAMVAVersionNumber
        self.jurisdictionVersionNumber = jurisdictionVersionNumber
        self.numberOfEntries = numberOfEntries
    }
}

extension Header: CustomStringConvertible {
    var description: String {
        return [
            Header.complianceIndicator,
            Header.dataElementSeparator,
            Header.recordSeparator,
            Header.segmentTerminator,
            Header.fileType,
            issuerIdentificationNumber,
            AAMVAVersionNumber,
            jurisdictionVersionNumber,
            numberOfEntries,
        ].joined(separator: "");
    }
}
