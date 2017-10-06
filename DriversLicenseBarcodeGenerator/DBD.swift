import Foundation

class DBD: DataElement<Date>, DataElementFormatable {
    func format() -> String {
        return "DBD\(DataElementFormatter.formatDate(date: data))"
    }
}
