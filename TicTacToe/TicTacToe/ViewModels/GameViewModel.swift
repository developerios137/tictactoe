import Foundation

enum GameStatus {
	case won
	case draw
	case progress
}

class GameViewModel {
	var gridSize = 3
	var currentPlayer = Player.player1
	var filledTilesCounter = 0
	var boardMap: [[Int]] = []
}

extension GameViewModel {

	//--------------------------------------------------------------------------
	// MARK: - Methods
	//--------------------------------------------------------------------------

	func resetGame() {
		self.currentPlayer = .player1
		self.filledTilesCounter = 0
		boardMap.removeAll()
		self.setupEmptyBoard()
	}

	func switchPlayer() {
		self.currentPlayer = currentPlayer == .player1 ? .player2 : .player1
	}

	func updateBoard(for position: Position) {
		boardMap[position.row][position.column] = position.player.rawValue
		self.filledTilesCounter += 1
	}
}

private extension GameViewModel {
	//--------------------------------------------------------------------------
	// MARK: - Private Methods
	//--------------------------------------------------------------------------

	func setupEmptyBoard() {
		(0..<gridSize).forEach({ _ in
			let rows = (0..<gridSize).map({ _ in 0 })
			boardMap.append(rows)
		})
	}
}
