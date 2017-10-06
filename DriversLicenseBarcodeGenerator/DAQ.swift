import Foundation

class DAQ: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DAQ\(DataElementFormatter.formatString(data, length: 6))"
    }
}
