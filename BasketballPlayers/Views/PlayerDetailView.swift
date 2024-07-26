import SwiftUI

struct PlayerDetailView: View {
    let player: Player

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Position: \(player.position ?? "N/A")")
                .font(.title2)
            Text("Height: \(player.height ?? "N/A")")
                .font(.title3)
            Text("Weight: \(player.weight ?? "N/A")")
                .font(.title3)
            Spacer()
        }
        .padding()
        .navigationTitle(player.fullName)
    }
}
