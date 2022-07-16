import SwiftUI

struct PanelView: View {
    let version: String
    let build: String
    
    var body: some View {
        NavigationView {
            List {
                Section("Info") {
                    Row(left: "Version", right: version)
                    Row(left: "Build", right: build)
                }
            }
            .navigationTitle("Debug Panel")
        }
        .navigationViewStyle(.stack)
    }
}

struct PanelView_Previews: PreviewProvider {
    static var previews: some View {
        PanelView(version: "1.0.1", build: "35")
    }
}
