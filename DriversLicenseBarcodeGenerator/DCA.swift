import Foundation

class DCA: NewDataElement<String> {
//    static let cardType: DataElement.CardType = .DL
//
//    static var lengthType: String {
//        return "V6ANS"
//    }
    
    override func format() -> String {
        return "DCA\(data)"
    }
}
