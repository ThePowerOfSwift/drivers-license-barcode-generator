import Foundation

class DAU: DataElement<Int>, DataElementFormatable {
    func format() -> String {
        return "DAU\(data) IN"
    }
}
