import Foundation

class DCB: DataElement<String> {
    static let cardType = DataElementCardType.DL
    static let lengthType = DataElementLengthType("V12ANS")

    override func format() -> String {
        let formatted = DataElementFormatter.formatString(string: data, lengthType: DCB.lengthType)

        return "DCB\(formatted)"
    }    
}
