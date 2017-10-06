import Foundation

class DCA: DataElement<String> {
    static let lengthType = DataElementLengthType("V6ANS")
    static let cardType = DataElementCardType.DL
    
    override func format() -> String {
        return DataElementFormatter.formatString(string: data, lengthType: DCA.lengthType)
    }
}
