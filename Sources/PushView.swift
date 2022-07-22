import SwiftUI

struct PushState {
    let all: [Push]
    var count: Int
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
    
    func update() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.pushState.count += 1
            self.objectWillChange.send()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.pushState.count += 1
        }
    }
}

struct PushView: View {
    let pushes: [Push]
    @StateObject var vm = PushViewModel(pushState: .init(all: [], count: 0))
    
    var body: some View {
        List {
            ForEach(pushes, id: \.self) { push in
                Section(push.id) {
                    Row(left: "title", right: push.title)
                    Row(left: "body", right: push.body)
                }
            }
            
            Stepper("\(vm.pushState.count)", value: $vm.pushState.count)
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
