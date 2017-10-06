import Foundation

class DDG: DataElement<DataElementTruncation>, DataElementFormatable {
    func format() -> String {
        return "DDG\(DataElementFormatter.formatString(data.rawValue, length: 6))"
    }
}
