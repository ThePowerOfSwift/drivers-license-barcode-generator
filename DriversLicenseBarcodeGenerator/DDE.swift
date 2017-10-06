import Foundation

class DDE: NewDataElement<DataElement.Truncation> {
//    static var cardType: DataElement.CardType {
//        return .Both
//    }
//    
//    static var lengthType: String {
//        return "V6ANS"
//    }
    
    override func format() -> String {
        return "DDE\(data)"
    }
}
