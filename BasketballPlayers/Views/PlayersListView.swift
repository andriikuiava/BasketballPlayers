import SwiftUI

struct PlayersListView: View {
    @StateObject private var viewModel = PlayersViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.players) { player in
                NavigationLink(destination: PlayerDetailView(player: player)) {
                    VStack(alignment: .leading) {
                        Text(player.fullName)
                            .font(.headline)
                        Text(player.position ?? "N/A")
                            .font(.subheadline)
                        Text("Height: \(player.height ?? "N/A"), Weight: \(player.weight ?? "N/A")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Players")
            .onAppear {
                viewModel.fetchPlayers()
            }
        }
    }
}

struct PlayersListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersListView()
    }
}
