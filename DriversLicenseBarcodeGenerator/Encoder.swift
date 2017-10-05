//
//  DriversLicenseBarcodeEncoder.swift
//  DriversLicenseBarcodeGenerator
//
//  Created by Kyle Decot on 10/5/17.
//  Copyright © 2017 Kyle Decot. All rights reserved.
//

import Foundation

enum SubfileType: String {
    case DL = "DL"
    case ID = "ID"
}

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
    
    static let jurisdictionVersionNumber = "00"
    
    
    // Number of Entries: This is a decimal value between “01 and 99” that specifies the number of 
    // different Subfile types that are contained in the bar code. This value defines the number 
    // of individual subfile designators that follow. All subfile designators (as defined below) 
    // follow one behind the other. The data related to the first subfile designator follows the 
    // last Subfile Designator.
    
    func numberOfEntries() {
        // TODO:
    }
    
    func generate() -> String {
        let header = Header(issuerIdentificationNumber: "00", AAMVAVersionNumber: "00", jurisdictionVersionNumber: "00", numberOfEntries: "01")
        
        return "\(header)"
    }
}
