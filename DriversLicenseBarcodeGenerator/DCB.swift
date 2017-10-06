import Foundation

class DCB: NewDataElement<String> {
//    static var cardType: DataElement.CardType {
//        return .DL
//    }
//    
//    static var lengthType: String {
//        return "V12ANS"
//    }

    override func format() -> String {
        return "DCB\(data)"
    }    
}
