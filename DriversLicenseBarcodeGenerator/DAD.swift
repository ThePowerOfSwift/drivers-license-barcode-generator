import Foundation

class DAD: DataElement<String> {
    func format() -> String {
        return "DAD\(DataElementFormatter.formatString(data, length: 40))"
    }
}
