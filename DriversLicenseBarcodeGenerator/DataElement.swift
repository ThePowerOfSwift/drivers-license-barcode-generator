import Foundation

class DataElement<T> {
    let data: T
    
    init(_ data: T) {
        self.data = data
    }
    
    func format() -> String {
        return "TODO"
    }
}
