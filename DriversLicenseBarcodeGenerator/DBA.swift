import Foundation

class DBA: DataElement<Date>, DataElementFormatable {
    func format() -> String {
        return "DBA\(DataElementFormatter.formatDate(date: data))"
    }
}
