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
    
    let dataElements: [DataElement<DataElementFormatable>]

    // Required Data Elements
//
//    var jurisdictionSpecificVehicleClass: DCA!
//    var jurisdictionSpecificRestrictionCodes: DBC!
//    var jurisdictionSpecificEndorsementCodes: DCD!
//    var documentExpirationDate: DBA!
//    var customerFamilyName: DCS!
//    var customerFirstName: DAC!
//    var customerMiddleNames: DAD!
//    var documentIssueDate: DBD!
//    var dateOfBirth: DBB!
//    var physicalDescriptionSex: DBC!
//    var physicalDescriptionEyeColor: DAY!
//    var phsyicalDescriptionHeight: DAU!
//    var addressStreet1: DAG!
//    var addressCity: DAI!
//    var addressJurisdictionCode: DAJ!
//    var addressPostalCode: DAK!
//    var customerIDNumber: DAQ!
//    var documentDiscriminator: DCF!
//    var countryIdentification: DCG!
//    var familyNameTruncation: DDE!
//    var firstNameTruncation: DDF!
//    var middleNameTruncation: DDG!
//
//    // Optional Data Elements
//
//    var street2: DataElement<Any>?
//    var hairColor: DataElement<Any>?
//    var placeOfBirth: DataElement<Any>?
//    var auditInformation: DataElement<Any>?
//    var inventoryControlNumber: DataElement<Any>?
//    var aliasFamilyName: DataElement<Any>?
//    var aliasGivenName: DataElement<Any>?
//    var aliasSuffixName: DataElement<Any>?
//    var nameSuffix: DataElement<Any>?
//    var weightRange: DataElement<Any>?
//    var ethnicity: DataElement<Any>?
//    var standardVehicleClassification: DataElement<Any>?
//    var standardEndorsementCode: DataElement<Any>?
//    var standardRestrictionCode: DataElement<Any>?
//    var specificVehicleClassificationDescription: DataElement<Any>?
//    var specificEndorsementCodeDescription: DataElement<Any>?
//    var specificRestrictionCodeDescription: DataElement<Any>?
//    var complianceType: DataElement<Any>?
//    var cardRevisionDate: DataElement<Any>?
//    var HAZMATEndorsementExpirationDate: DataElement<Any>?
//    var limitedDurationDocumentIndicator: DataElement<Any>?
//    var weightPounds: DataElement<Any>?
//    var weightKilograms: DataElement<Any>?
//    var under18Until: DataElement<Any>?
//    var under19Until: DataElement<Any>?
//    var under21Until: DataElement<Any>?
//    var organDonorIndicator: DataElement<Any>?
//    var veteranIndicator: DataElement<Any>?

    var data: Data {
        return description.data(using: String.Encoding.ascii)!
    }

    init(dataElements: [DataElement<DataElementFormatable>]) {
        self.dataElements = dataElements
    }
}

extension Barcode: CustomStringConvertible {
    var description: String {
        let formattedDataElemented = dataElements.map { $0.format() }
        
        return "\(header)\(formattedDataElemented.joined(separator: Barcode.dataElementSeparator))"
    }

    private var header: Header {
        return Header(issuerIdentificationNumber: "00", AAMVAVersionNumber: "00", jurisdictionVersionNumber: "00", numberOfEntries: "01")
    }
}


