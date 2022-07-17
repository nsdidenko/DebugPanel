import SwiftUI

struct PanelView: View {
    let bundleId: String
    let version: String
    let build: String
    let idfa: String
    
    let customInfo: [CustomInfo]
    let remoteConfigInfo: [RemoteConfigInfo]
    
    var body: some View {
        NavigationView {
            List {
                Section("Info") {
                    Row(left: "Bundle ID", right: bundleId)
                    Row(left: "Version", right: version)
                    Row(left: "Build", right: build)
                    Row(left: "IDFA", right: idfa)
                    
                    ForEach(customInfo, id: \.self) {
                        Row(left: $0.title, right: $0.value)
                    }
                }
                
                Section("Remote Config") {
                    ForEach(remoteConfigInfo, id: \.self) {
                        Row(left: $0.key, right: $0.value)
                    }
                }
            }
            .navigationTitle("Debug Panel")
        }
        .navigationViewStyle(.stack)
    }
}

struct PanelView_Previews: PreviewProvider {
    static var previews: some View {
        PanelView(
            bundleId: "com.nd.anytext",
            version: "1.0.1",
            build: "35",
            idfa: UUID().uuidString,
            customInfo: [
                .init(title: "User ID", value: UUID().uuidString)
            ],
            remoteConfigInfo: [
                .init(key: "push_notifications_enabled", value: "true"),
                .init(key: "debug_panel_enabled", value: "true"),
            ])
    }
}
