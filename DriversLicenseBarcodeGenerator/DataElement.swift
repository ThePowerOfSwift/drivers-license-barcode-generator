import Foundation

class DataElement {
    enum Truncation: String {
        case Yes = "T"
        case No = "N"
        case Unknown = "U"
    }
    
    enum CountryIdentificationCode: String {
        case US = "USA"
        case CA = "CAN"
    }
    
    enum Gender: Int {
        case Male = 1
        case Female = 2
        case NotSpecified = 3
    }

    enum CardType {
        case DL, ID, Both
    }
}

//    

//    
//    case DAH(String)
//    case DCA(String)
//    case DCB(String)
//    case DCD(String)
//    case DBA(Date)
//
//    case DCS(String)
//    case DCF(String)
//    case DFC(String)
//    case DAC(String)
//    case DAD([String])
//    case DBB(Date)
//    case DBD(Date)
//    case DBC(Int)
//    case DAY(String) // TODO: Use enum for eye color
//    case DAU(Int)
//    case DAG(String)
//    case DAI(String)
//    case DAK(String)
//    case DAJ(String)
//    case DAQ(String)
//    case DCG(String) // TODO: Use enum for country identification (USA or CAN)
//    case DDE(Truncation)
//    case DDF(Truncation)
//    case DDG(Truncation)
//    
//    var commonName: String {
//        switch self {
//        case .DAH:
//            return "Jurisdiction- specific endorsement codes"
//        case .DBA:
//            return "Document Expiration Date"
//
//        // TODO: Remove default after all data elements added
//        default:
//            return ""
//        }
//    }
//    
//    var cardType: CardType {
//        switch self {
//        case .DAH:
//            return .Both
//
//        // TODO: Remove default after all data elements added
//        default:
//            return .DL
//        }
//    }
//    
//    var data: Data {
//        return Data() // TODO
//    }
//}
//
//extension DataElement: CustomStringConvertible {
//    var description: String {
//        switch self {
//        case .DCS(let customerFamilyName):
//            return "DCS\(customerFamilyName)"
//        case .DAH(let addressStreet2):
//            return "DAH\(addressStreet2)"
//        case .DCA(let jurisdictionSpecificVehicleClass):
//            return "DCA\(jurisdictionSpecificVehicleClass)"
//        case .DCB(let jurisdictionSpecificRestrictionCodes):
//            return "DCB\(jurisdictionSpecificRestrictionCodes)"
//        case .DCD(let jurisdictionSpecificEndorsementCodes):
//            return "DCD\(jurisdictionSpecificEndorsementCodes)"
//        case .DBA(let documentExpirationDate):
//            return "DBA\(formatDate(date: documentExpirationDate))"
//        default:
//            return "NOT IMPLEMENTED"
//        }
//    }
//    
//    private func formatDate(date: Date) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US")
//        dateFormatter.setLocalizedDateFormatFromTemplate("MMddyyyy")
//        
//        return dateFormatter.string(from: date)
//    }
//}
