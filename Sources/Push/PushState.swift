
struct PushState {
    var all: [Push]
}

struct Push: Hashable {
    let id: String
    let title: String
    let body: String
}
