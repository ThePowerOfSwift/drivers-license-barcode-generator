import Foundation

class DCF: NewDataElement<String> {
//    static var cardType: DataElement.CardType {
//        return .Both
//    }
//    
//    static var lengthType: String {
//        return "V6ANS"
//    }
    
    override func format() -> String {
        return "DCF\(data)"
    }
}
