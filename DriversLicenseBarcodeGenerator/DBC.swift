import Foundation

class DBC: NewDataElement<DataElement.Gender> {
//    static var cardType: DataElement.CardType {
//        return .Both
//    }
//    
//    static var lengthType: String {
//        return "V6ANS"
//    }

    override func format() -> String {
        return "DBC\(data)"
    }
}
