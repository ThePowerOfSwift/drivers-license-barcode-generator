import Foundation

class DCA: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "\(String(describing: self))\(DataElementFormatter.formatString(data, length: 6))"
    }
}
