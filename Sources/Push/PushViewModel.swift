import SwiftUI

class PushViewModel: ObservableObject {
    @Published var pushState: PushState

    init(pushState: PushState) {
        self.pushState = pushState
        
        update()
    }
    
    func update() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.pushState.all = [
                .init(id: "id-1", title: "title-1", body: "body-1"),
                .init(id: "id-2", title: "title-2", body: "body-2")
            ]
        }
    }
}
