//
//  DataElement.swift
//  DriversLicenseBarcodeGenerator
//
//  Created by Kyle Decot on 10/5/17.
//  Copyright © 2017 Kyle Decot. All rights reserved.
//

import Foundation

enum DataElement {
    enum Truncation: String {
        case Yes = "T"
        case No = "N"
        case Unknown = "U"
    }
    
    enum CardType {
        case DL, ID, Both
    }
    
    case DAH(String)
    case DCA(String)
    case DCB(String)
    case DCD(String)
    case DBA(String)
    case DCS(String)
    case DFC(String)
    
    var commonName: String {
        switch self {
        case .DAH:
            return "Jurisdiction- specific endorsement codes"
        case .DBA:
            return "Document Expiration Date"
        default:
            return ""
        }
    }
    
    var cardType: CardType {
        switch self {
        case .DAH:
            return .Both
        default:
            return .DL
        }
    }
}


DataElement.DCF("123455")
