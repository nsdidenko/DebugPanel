import Foundation

public final class Panel {
    private init() {}
    public static let shared = Panel()
    
    private var debugPanelObservation: NSObjectProtocol?
    
    public enum ShowCondition {
        case byShake
    }
    
    public func configure(_ showCondition: ShowCondition, customInfo: [CustomInfo]) {
        switch showCondition {
        case .byShake:
            debugPanelObservation = NotificationCenter.observeShakeBegan {
                showDebugPanel(customInfo: customInfo)
            }
        }
    }
}
