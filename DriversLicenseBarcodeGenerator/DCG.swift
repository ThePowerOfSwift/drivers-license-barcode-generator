import Foundation

class DCG: DataElement<DataElementCountryIdentificationCode>, DataElementFormatable {    
    func format() -> String {
        return "DCG\(DataElementFormatter.formatString(data.rawValue, length: 6))"
    }
}
