import Foundation

class DDE: DataElement<DataElementTruncation>, DataElementFormatable {
    func format() -> String {
        return "DDE\(DataElementFormatter.formatString(data.rawValue, length: 1))"
    }
}
