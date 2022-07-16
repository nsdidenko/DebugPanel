import SwiftUI

struct PanelView: View {
    var body: some View {
        Text("Hello, World!!!")
    }
}

struct PanelView_Previews: PreviewProvider {
    static var previews: some View {
        PanelView()
    }
}

public final class Panel {
    private init() {}
    public static let shared = Panel()
    
    private var debugPanelObservation: NSObjectProtocol?
    
    public enum ShowCondition {
        case byShake
    }
    
    public func configure(_ showCondition: ShowCondition) {
        switch showCondition {
        case .byShake:
            debugPanelObservation = NotificationCenter.observeShakeBegan {
                showDebugPanel()
            }
        }
    }
}
