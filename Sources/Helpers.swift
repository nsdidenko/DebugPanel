import UIKit
import SwiftUI

func getTopViewController() -> UIViewController? {
    let keyWindow = UIApplication.shared.windows.filter(\.isKeyWindow).first

    if var topController = keyWindow?.rootViewController {
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }

        return topController
    } else {
        return nil
    }
}

func showDebugPanel() {
    guard let topVC = getTopViewController(),
          topVC as? UIHostingController<PanelView> == nil else { return }
    
    let panel = UIHostingController(
        rootView: PanelView(
            version: Bundle.main.version.or("???"),
            build: Bundle.main.build.or("???")))
    
    let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .heavy)
    impactFeedbackgenerator.impactOccurred()
    topVC.present(panel, animated: true, completion: nil)
}

extension UIViewController {
    open override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake { NotificationCenter.postShakeBegan() }
    }
}

extension NotificationCenter {
    static func observeShakeBegan(completion: @escaping () -> Void) -> NSObjectProtocol {
        NotificationCenter.default.addObserver(forName: shakeBeganName, object: nil, queue: .main) { _ in
            completion()
        }
    }

    static func postShakeBegan() {
        NotificationCenter.default.post(name: shakeBeganName, object: nil)
    }

    private static var shakeBeganName: NSNotification.Name { .init(rawValue: "shake_began") }
}

extension Bundle {
    var version: String? {
        infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    var build: String? {
        infoDictionary?["CFBundleVersion"] as? String
    }
}

public extension Optional {
    func or(_ value: Wrapped) -> Wrapped {
        switch self {
        case let .some(value):
            return value
        case .none:
            return value
        }
    }
}
