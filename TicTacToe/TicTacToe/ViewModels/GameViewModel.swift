import Foundation

class GameViewModel {
	var gridSize = 3
	var currentPlayer = Player.player1
}

extension GameViewModel {

	//--------------------------------------------------------------------------
	// MARK: - Methods
	//--------------------------------------------------------------------------

	func resetGame() {
		self.currentPlayer = .player1
	}

	func switchPlayer() {
		self.currentPlayer = currentPlayer == .player1 ? .player2 : .player1
	}
}
