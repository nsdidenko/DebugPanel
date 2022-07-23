import SwiftUI
import UserNotifications

struct PushView: View {
    @StateObject var vm = PushViewModel(pushState: .init(requests: []))
    
    private var requests: [UNNotificationRequest] {
        vm.pushState.requests
    }
    
    private func string(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        return formatter.string(from: date)
    }
    
    var body: some View {
        List {
            ForEach(requests, id: \.self) { request in
                Section(request.identifier) {
                    Row(left: "Title", right: request.content.title)
                    Row(left: "Body", right: request.content.body)
                    Row(left: "Category ID", right: request.content.categoryIdentifier)
                    
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
