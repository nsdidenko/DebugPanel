import SwiftUI
import UserNotifications

struct PushView: View {
    @StateObject var vm = PushViewModel(pushState: .init(requests: []))
    
    var body: some View {
        List {
            ForEach(requests, id: \.self) { request in
                Section {
                    Row(left: "Id", right: request.identifier)
                    Row(left: "Title", right: request.content.title)
                    Row(left: "Body", right: request.content.body)
                    
                    if !request.content.categoryIdentifier.isEmpty {
                        Row(left: "Category ID", right: request.content.categoryIdentifier)
                    }
                    
                    if let badge = request.content.badge {
                        Row(left: "Badge", right: "\(badge)")
                    }
                    
                    if let trigger = request.trigger {
                        Row(left: "Repeats", right: String(trigger.repeats))
                    }
                    
                    ForEach(userInfo(from: request), id: \.self) { info in
                        Row(left: info.key, right: info.value)
                    }
                }
            }
        }
        .navigationTitle("Push Notifications")
    }
    
    // MARK: - Helpers
    
    private struct UserInfo: Hashable {
        let key: String
        let value: String
    }
    
    private var requests: [UNNotificationRequest] {
        vm.pushState.requests
    }
    
    private func userInfo(from request: UNNotificationRequest) -> [UserInfo] {
        request.content.userInfo.map {
            .init(key: $0 as? String ?? "???",
                  value: $1 as? String ?? "???")
        }
    }
}

struct PushView_Previews: PreviewProvider {
    static var previews: some View {
        PushView()
    }
}
