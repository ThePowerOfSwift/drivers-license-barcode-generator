import Foundation

class DBB: DataElement<Date>, DataElementFormatable {
    func format() -> String {
        return "DBB\(DataElementFormatter.formatDate(date: data))"
    }
}
