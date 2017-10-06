import Foundation

class DAD: DataElement<[String]>, DataElementFormatable {
    func format() -> String {
        return "DAD\(DataElementFormatter.formatString(data.joined(separator: ","), length: 40))"
    }
}
