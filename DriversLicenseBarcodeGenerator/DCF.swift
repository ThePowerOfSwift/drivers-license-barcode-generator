import Foundation

class DCF: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DCF\(DataElementFormatter.formatString(data, length: 6))"
    }
}
