import SwiftUI
import UserNotifications

struct PushView: View {
    @StateObject var vm = PushViewModel(pushState: .init(requests: []))
    
    private var requests: [UNNotificationRequest] {
        vm.pushState.requests
    }
    
    private func index(of request: UNNotificationRequest) -> String {
        String(requests.firstIndex(of: request)!)
    }
    
    var body: some View {
        List {
            ForEach(requests, id: \.self) { request in
                Section(index(of: request)) {
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
                }
            }
        }
        .navigationTitle("Push Notifications")
    }
}

struct PushView_Previews: PreviewProvider {
    static var previews: some View {
        PushView()
    }
}
