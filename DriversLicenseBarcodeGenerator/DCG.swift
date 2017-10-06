import Foundation

class DCG: NewDataElement<DataElement.CountryIdentificationCode> {
//    static var cardType: DataElement.CardType {
//        return .Both
//    }
//    
//    static var lengthType: String {
//        return "V6ANS"
//    }
    
    override func format() -> String {
        return "DCG\(data.rawValue)"
    }
}
