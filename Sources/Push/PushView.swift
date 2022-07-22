import SwiftUI

struct PushView: View {
    @StateObject var vm = PushViewModel(pushState: .init(all: []))
    
    private var pushes: [Push] {
        vm.pushState.all
    }
    
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
        PushView()
    }
}
