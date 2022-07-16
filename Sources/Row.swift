import SwiftUI

struct Row: View {
    let left: String
    let right: String
    
    var body: some View {
        HStack {
            Text(left).padding(.trailing)
            Spacer()
            Text(right)
        }
    }
}
