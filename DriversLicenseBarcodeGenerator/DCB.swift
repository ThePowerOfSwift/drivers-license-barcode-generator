import Foundation

class DCB: DataElement<String>, DataElementFormatable {
    func format() -> String {
        return "DCB\(DataElementFormatter.formatString(data, length: 12))"
    }    
}
