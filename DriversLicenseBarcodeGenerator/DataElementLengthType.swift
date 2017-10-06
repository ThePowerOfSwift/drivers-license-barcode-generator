import Foundation

class DataElementLengthType {
    let value: String
    
    var length: Int {
        return 5
    }
    
    
    init(_ value: String) {
//        let regex = try! NSRegularExpression(pattern: "(?<lengthType>A|F)(?<length>\\d+)(?<valueTypes>[ANS])", options: [])
//        let matches = regex.matches(in: value, options: [], range: NSRangeFromString(value))
//        
        
        
        self.value = value
        
    }
}
