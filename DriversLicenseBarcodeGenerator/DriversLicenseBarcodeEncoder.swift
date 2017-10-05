//
//  DriversLicenseBarcodeEncoder.swift
//  DriversLicenseBarcodeGenerator
//
//  Created by Kyle Decot on 10/5/17.
//  Copyright © 2017 Kyle Decot. All rights reserved.
//

import Foundation

class Encoder {
    static let complianceIndicator = "\u{40}"
    static let dataElementSeparator = "\u{0A}"
    static let recordSeparator = "\u{1E}"
    static let segmentSeparator = "\u{0D}"

    // File Type: This is the designator that identifies the file as an AAMVA compliant format. 
    // The designator is defined as the 5 byte upper character string “ANSI “, with a blank 
    // space after the fourth character.
  
    static let fileType = "ANSI "
    
    //    Issuer Identification Number (IIN)9: This number uniquely identifies
    //    7F
    //    the issuing jurisdiction and can be obtained by contacting the ISO Issuing Authority (AAMVA). The full 6-digit IIN should be encoded.
    // TODO: This is dymanic by jurisdiction
    static let issuerIdentificationNumber = ""
    
    static let AAMVAVersionNumber = "08" // current version of the AAMVA standard
}
