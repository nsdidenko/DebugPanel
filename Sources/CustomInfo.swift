import Foundation

public struct CustomInfo: Hashable {
    public init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
    let title: String
    let value: String
}
