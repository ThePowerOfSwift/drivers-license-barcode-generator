import Foundation

class DDF: DataElement<DataElementTruncation>, DataElementFormatable {
    func format() -> String {
        return "DDF\(DataElementFormatter.formatString(data.rawValue, length: 6))"
    }
}
