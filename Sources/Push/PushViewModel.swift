import SwiftUI
import UserNotifications

class PushViewModel: ObservableObject {
    @Published var pushState: PushState

    init(pushState: PushState) {
        self.pushState = pushState
        
        update()
    }
    
    func update() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            DispatchQueue.main.async {
                self.pushState.requests = requests
            }
        }
    }
}
