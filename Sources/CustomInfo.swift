import Foundation

public struct CustomInfo: Hashable {
    public init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
    let title: String
    let value: String
}

public struct RemoteConfigInfo: Hashable {
    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }
    
    let key: String
    let value: String
}
