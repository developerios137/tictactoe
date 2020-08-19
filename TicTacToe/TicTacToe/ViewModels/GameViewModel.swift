import Foundation

class GameViewModel {
	var gridSize = 3
	var currentPlayer = Player.player1
}

extension GameViewModel {
	func switchPlayer() {
		self.currentPlayer = currentPlayer == .player1 ? .player2 : .player1
	}
}
