import SwiftUI

class PushState {
    var all = [Push]()
}

struct Push: Hashable {
    let id: String
    let title: String
    let body: String
}

class PushViewModel: ObservableObject {
    @Published var pushState: PushState
    
    init(pushState: PushState) {
        self.pushState = pushState
    }
}

struct PushView: View {
    let pushes: [Push]
    
    var body: some View {
        List {
            ForEach(pushes, id: \.self) { push in
                Section(push.id) {
                    Row(left: "title", right: push.title)
                    Row(left: "body", right: push.body)
                }
            }
        }
    }
}

struct PushView_Previews: PreviewProvider {
    static var previews: some View {
        view
    }
    
    static var view: some View {
        PushView(pushes: [
            .init(id: "evening_notification_id", title: "Hi!", body: "Let's track your mood 😉"),
            .init(id: "morning_notification_id", title: "Well well...", body: "You didn't track your mood yesterday 🙈")
        ])
    }
}
