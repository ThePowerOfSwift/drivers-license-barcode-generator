import Foundation

class DAY: DataElement<DataElementEyeColor>, DataElementFormatable {
    func format() -> String {
        return "DAY\(DataElementFormatter.formatString(data.rawValue, length: 3))"
    }
}
