import Foundation

class DCS: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DCS\(DataElementFormatter.formatString(data, length: 6))"
    }
}
