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
    
    // Required Data Elements
        
    var jurisdictionSpecificVehicleClass: DataElement!
    var jurisdictionSpecificRestrictionCodes: DataElement!
    var jurisdictionSpecificEndorsementCodes: DataElement!
    var documentExpirationDate: DataElement!
    var customerFamilyName: DataElement!
    var customerFirstName: DataElement!
    var customerMiddleNames: DataElement!
    var documentIssueDate: DataElement!
    var dateOfBirth: DataElement!
    var physicalDescriptionSex: DataElement!
    var physicalDescriptionEyeColor: DataElement!
    var phsyicalDescriptionHeight: DataElement!
    var addressStreet1: DataElement!
    var addressCity: DataElement!
    var addressJurisdictionCode: DataElement!
    var addressPostalCode: DataElement!
    var customerIDNumber: DataElement!
    var documentDiscriminator: DataElement!
    var countryIdentification: DataElement!
    var familyNameTruncation: DataElement!
    var firstNameTruncation: DataElement!
    var middleNameTruncation: DataElement!

    // Optional Data Elements
    
    var street2: DataElement?
    var hairColor: DataElement?
    var placeOfBirth: DataElement?
    var auditInformation: DataElement?
    var inventoryControlNumber: DataElement?
    var aliasFamilyName: DataElement?
    var aliasGivenName: DataElement?
    var aliasSuffixName: DataElement?
    var nameSuffix: DataElement?
    var weightRange: DataElement?
    var ethnicity: DataElement?
    var standardVehicleClassification: DataElement?
    var standardEndorsementCode: DataElement?
    var standardRestrictionCode: DataElement?
    var specificVehicleClassificationDescription: DataElement?
    var specificEndorsementCodeDescription: DataElement?
    var specificRestrictionCodeDescription: DataElement?
    var complianceType: DataElement?
    var cardRevisionDate: DataElement?
    var HAZMATEndorsementExpirationDate: DataElement?
    var limitedDurationDocumentIndicator: DataElement?
    var weightPounds: DataElement?
    var weightKilograms: DataElement?
    var under18Until: DataElement?
    var under19Until: DataElement?
    var under21Until: DataElement?
    var organDonorIndicator: DataElement?
    var veteranIndicator: DataElement?
    
    var data: Data {
        return description.data(using: String.Encoding.ascii)!
    }
    
    init(dataElements: [DataElement]) {
        // TODO: Assign each data element passed in
    }
}

extension Barcode: CustomStringConvertible {
    var description: String {
        let requiredDataElementDescriptions = [
            jurisdictionSpecificVehicleClass,
            jurisdictionSpecificRestrictionCodes,
            jurisdictionSpecificEndorsementCodes,
            documentExpirationDate,
            customerFamilyName,
            customerFirstName,
            customerMiddleNames,
            documentIssueDate,
            dateOfBirth,
            physicalDescriptionSex,
            physicalDescriptionEyeColor,
            phsyicalDescriptionHeight,
            addressStreet1,
            addressCity,
            addressJurisdictionCode,
            addressPostalCode,
            customerIDNumber,
            documentDiscriminator,
            countryIdentification,
            familyNameTruncation,
            firstNameTruncation,
            middleNameTruncation
        ].map { $0.description }.joined(separator: "")

        return "\(header)\(requiredDataElementDescriptions)"
    }
    
    private var header: Header {
        return Header(issuerIdentificationNumber: "00", AAMVAVersionNumber: "00", jurisdictionVersionNumber: "00", numberOfEntries: "01")
    }
}

