import Foundation

class DCA: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DCA\(DataElementFormatter.formatString(data, length: 6))"
    }
}
