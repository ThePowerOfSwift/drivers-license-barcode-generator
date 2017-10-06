import Foundation

enum SubfileType: String {
    case DL = "DL"
    case ID = "ID"
}

class Barcode {
    static let complianceIndicator = "\u{40}"
    static let dataElementSeparator = "\u{0A}"
    static let recordSeparator = "\u{1E}"
    static let segmentSeparator = "\u{0D}"
    static let fileType = "ANSI "

    static let issuerIdentificationNumber = ""
    static let AAMVAVersionNumber = "08" // current version of the AAMVA standard
    static let jurisdictionVersionNumber = "00"
    
    let dataElements: [Any]

    var data: Data {
        return description.data(using: String.Encoding.ascii)!
    }

    init(dataElements: [Any]) {
        self.dataElements = dataElements
    }
}

extension Barcode: CustomStringConvertible {
    var description: String {
        let header = Header(issuerIdentificationNumber: "00", AAMVAVersionNumber: "00", jurisdictionVersionNumber: "00", numberOfEntries: "\(dataElements.count)")
        let formattedDataElemented = dataElements.map { ($0 as! DataElementFormatable).format() }
        
        return "\(header)\(formattedDataElemented.joined(separator: Barcode.dataElementSeparator))"
    }
}


