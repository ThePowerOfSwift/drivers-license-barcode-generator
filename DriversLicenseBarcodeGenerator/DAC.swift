import Foundation

class DAC: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DAC\(DataElementFormatter.formatString(data, length: 6))"
    }
}
