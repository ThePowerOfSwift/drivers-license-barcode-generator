import Foundation

class DAI: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DAI\(data)"
    }
}
