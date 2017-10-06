import Foundation

class NewDataElement<T> {
//    static var cardType: DataElement.CardType { get }
//    static var lengthType: String { get }
    
    let data: T
    
    init(_ data: T) {
        self.data = data
    }

    func format() -> String {
        return "TODO"
    }
}
