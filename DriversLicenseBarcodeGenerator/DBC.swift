import Foundation

class DBC: DataElement<DataElementGender>, DataElementFormatable {
    func format() -> String {
        return "DBC\(data.rawValue)"
    }
}
