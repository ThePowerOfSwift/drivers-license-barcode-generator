import Foundation

class DAK: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DAK\(DataElementFormatter.formatString(data, length: 6))"
    }
}
