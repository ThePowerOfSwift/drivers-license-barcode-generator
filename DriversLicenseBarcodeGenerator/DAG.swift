import Foundation

class DAG: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DAG\(DataElementFormatter.formatString(data, length: 6))"
    }
}
