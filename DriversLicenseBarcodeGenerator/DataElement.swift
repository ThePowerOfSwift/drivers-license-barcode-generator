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
    case DBA(Date)
    case DCS(String)
    case DCF(String)
    case DFC(String)
    case DAC(String)
    case DAD([String])
    case DBB(Date)
    case DBD(Date)
    case DBC(Int)
    case DAY(String) // TODO: Use enum for eye color
    case DAU(Int)
    case DAG(String)
    case DAI(String)
    case DAK(String)
    case DAJ(String)
    case DAQ(String)
    case DCG(String) // TODO: Use enum for country identification (USA or CAN)
    case DDE(Truncation)
    case DDF(Truncation)
    case DDG(Truncation)
    
    var commonName: String {
        switch self {
        case .DAH:
            return "Jurisdiction- specific endorsement codes"
        case .DBA:
            return "Document Expiration Date"

        // TODO: Remove default after all data elements added
        default:
            return ""
        }
    }
    
    var cardType: CardType {
        switch self {
        case .DAH:
            return .Both

        // TODO: Remove default after all data elements added
        default:
            return .DL
        }
    }
}

extension DataElement: CustomStringConvertible {
    var description: String {
        return "hello"
    }
}
