import Foundation
import Combine

class PlayersViewModel: ObservableObject {
    @Published var players = [Player]()
    private var apiService = APIService()
    
    func fetchPlayers() {
        apiService.fetchPlayers { [weak self] players in
            if let players = players {
                DispatchQueue.main.async {
                    self?.players = players
                    self?.printPlayersArray(players)
                }
            }
        }
    }
    
    private func printPlayersArray(_ players: [Player]) {
        for player in players {
            print("ID: \(player.id), Full Name: \(player.fullName), Position: \(player.position ?? "N/A"), Height: \(player.height ?? "N/A"), Weight: \(player.weight ?? "N/A")")
        }
    }
}
