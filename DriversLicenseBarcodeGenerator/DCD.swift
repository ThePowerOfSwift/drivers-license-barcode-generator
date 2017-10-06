import Foundation

class DCD: DataElement<String> {
//    static var cardType: DataElement.CardType {
//        return .DL
//    }
//    
//    static var lengthType: String {
//        return "V5ANS"
//    }
//    
    override func format() -> String {
        return "DCD\(data)"
    }
}
