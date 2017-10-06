import Foundation

// TODO: Make Eye color a enum

class DAY: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DAY\(DataElementFormatter.formatString(data, length: 6))"
    }
}
