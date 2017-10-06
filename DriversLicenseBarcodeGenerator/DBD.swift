import Foundation

class DBD: DataElement<Date> {
//    static var cardType: DataElement.CardType {
//        return .Both
//    }
//    
//    static var lengthType: String {
//        return "V6ANS"
//    }

    override func format() -> String {
        return "DBD\(data)"
    }
}
