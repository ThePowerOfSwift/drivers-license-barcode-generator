import Foundation

class DCD: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DCD\(DataElementFormatter.formatString(data, length: 5))"
    }
}
