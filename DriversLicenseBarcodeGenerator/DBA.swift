import Foundation

class DBA: NewDataElement<Date> {
//    static var cardType: DataElement.CardType {
//        return .Both
//    }
//    
//    static var lengthType: String {
//        return "V5ANS"
//    }

    override func format() -> String {
        let formattedDate = DataElementFormatter.formatDate(date: data)

        return "DBA\(formattedDate)"
    }
}
