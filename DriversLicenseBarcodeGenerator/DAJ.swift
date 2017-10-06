import Foundation

class DAJ: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DAJ\(DataElementFormatter.formatString(data, length: 6))"
    }
}
