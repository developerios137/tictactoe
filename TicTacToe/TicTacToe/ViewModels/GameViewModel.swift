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
		currentPlayer = .player1
		filledTilesCounter = 0
		boardMap.removeAll()
		setupEmptyBoard()
	}

	func switchPlayer() {
		currentPlayer = currentPlayer == .player1 ? .player2 : .player1
	}

	func updateBoard(for position: Position,
					 completion: @escaping (_ status: GameStatus) -> Void) {
		boardMap[position.row][position.column] = position.player.rawValue
		filledTilesCounter += 1
		let status = updateUIAfterMove(for: position)
		completion(status)
	}
}

private extension GameViewModel {

	//--------------------------------------------------------------------------
	// MARK: - Private Methods
	//--------------------------------------------------------------------------

	func setupEmptyBoard() {
		/* The empty board is a place holder to store the occupied position of each players */
		(0..<gridSize).forEach({ _ in
			let rows = (0..<gridSize).map({ _ in 0 })
			boardMap.append(rows)
		})
	}

	func updateUIAfterMove(for position: Position) -> GameStatus {

		if checkIfPlayerWon(position) {
			return .won
		}

		if filledTilesCounter == gridSize * gridSize {
			return .draw
		}

		switchPlayer()
		return .progress
	}
}

private extension GameViewModel {

	//--------------------------------------------------------------------------
	// MARK: - Winning logic
	//--------------------------------------------------------------------------

	func checkIfPlayerWon(_ position: Position) -> Bool {

		if isFullRowCompletedByPlayer(position) {
			return true
		}

		if isFullColumnCompletedByPlayer(position) {
			return true
		}

		if isFullPrimaryDiagonalCompletedByPlayer(position) {
			return true
		}

		if isFullAntiDiagonalCompletedByPlayer(position) {
			return true
		}

		return false
	}
	
	func isFullRowCompletedByPlayer(_ position: Position) -> Bool {
		return boardMap[position.row].allSatisfy({ $0 == position.player.rawValue })
	}

	func isFullColumnCompletedByPlayer(_ position: Position) -> Bool {
		return boardMap[column: position.column].allSatisfy({ $0 == position.player.rawValue })
	}

	func isFullPrimaryDiagonalCompletedByPlayer(_ position: Position) -> Bool {
		var primaryDiagonalArray = [Int]()

		for index in (0..<gridSize) {
			primaryDiagonalArray.append(boardMap[index][index])
		}

		return primaryDiagonalArray.allSatisfy({ $0 == position.player.rawValue })
	}

	func isFullAntiDiagonalCompletedByPlayer(_ position: Position) -> Bool {
		var antiDiagonalArray = [Int]()

		for index in (0..<gridSize) {
			antiDiagonalArray.append(boardMap[index][gridSize - index - 1])
		}

		return antiDiagonalArray.allSatisfy({ $0 == position.player.rawValue
		})
	}
}
