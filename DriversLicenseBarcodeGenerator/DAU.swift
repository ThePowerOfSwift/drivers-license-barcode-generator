import Foundation

class DAU: DataElement<Int> {
//    static var cardType: DataElement.CardType {
//        return .Both
//    }
//    
//    static var lengthType: String {
//        return "V6ANS"
//    }
//    
    
    override func format() -> String {
        return "DAU\(data)"
    }
}
