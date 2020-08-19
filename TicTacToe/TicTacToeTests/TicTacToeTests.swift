import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {

	private var gameViewModel: GameViewModel!
	private var gameStatus: GameStatus!
	
    override func setUp() {
		gameViewModel = GameViewModel()
    }

    override func tearDown() {
		gameViewModel = nil
    }

	//--------------------------------------------------------------------------
	// MARK: - Game start tests
	//--------------------------------------------------------------------------

	func test_shouldReturn_GridSize3_On_Start() {
		XCTAssertEqual(gameViewModel.gridSize, 3)
    }

	func test_shouldReturn_PlayerX_On_Start() {
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "X")
	}

	func test_shouldReturn_PlayerO_On_PlayerChange() {
		gameViewModel.switchPlayer()
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "O")
	}

	func test_shouldReturn_PlayerX_On_GameReset() {
		gameViewModel.resetGame()
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "X")
	}

	func test_shouldIncrease_filledTileCounter_On_Board_Update() {
		gameViewModel.resetGame()

		let position = Position(row: 0, column: 0, player: .player1)

		updateBoard(with: [position])

		XCTAssertEqual(gameViewModel.filledTilesCounter, 1)
	}

	//--------------------------------------------------------------------------
	// MARK: - Winning logic - Rows
	//--------------------------------------------------------------------------

	func test_shouldReturn_PlayerX_Won_By_Filling_TopRow() {
		gameViewModel.resetGame()

		let position1 = Position(row: 0, column: 0, player: .player1)
		let position2 = Position(row: 0, column: 1, player: .player1)
		let position3 = Position(row: 0, column: 2, player: .player1)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "X")
	}

	func test_shouldReturn_PlayerX_Won_By_Filling_MiddleRow() {
		gameViewModel.resetGame()

		let position1 = Position(row: 1, column: 0, player: .player1)
		let position2 = Position(row: 1, column: 1, player: .player1)
		let position3 = Position(row: 1, column: 2, player: .player1)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "X")
	}

	func test_shouldReturn_PlayerX_Won_By_Filling_BottomRow() {
		gameViewModel.resetGame()

		let position1 = Position(row: 2, column: 0, player: .player1)
		let position2 = Position(row: 2, column: 1, player: .player1)
		let position3 = Position(row: 2, column: 2, player: .player1)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "X")
	}

	func test_shouldReturn_PlayerO_Won_By_Filling_TopRow() {
		gameViewModel.resetGame()
		gameViewModel.switchPlayer()

		let position1 = Position(row: 0, column: 0, player: .player2)
		let position2 = Position(row: 0, column: 1, player: .player2)
		let position3 = Position(row: 0, column: 2, player: .player2)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "O")
	}

	func test_shouldReturn_PlayerO_Won_By_Filling_MiddleRow() {
		gameViewModel.resetGame()
		gameViewModel.switchPlayer()

		let position1 = Position(row: 1, column: 0, player: .player2)
		let position2 = Position(row: 1, column: 1, player: .player2)
		let position3 = Position(row: 1, column: 2, player: .player2)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "O")
	}

	func test_shouldReturn_PlayerO_Won_By_Filling_BottomRow() {
		gameViewModel.resetGame()
		gameViewModel.switchPlayer()

		let position1 = Position(row: 2, column: 0, player: .player2)
		let position2 = Position(row: 2, column: 1, player: .player2)
		let position3 = Position(row: 2, column: 2, player: .player2)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "O")
	}

	//--------------------------------------------------------------------------
	// MARK: - Winning logic - Columns
	//--------------------------------------------------------------------------

	func test_shouldReturn_PlayerX_Won_By_Filling_FirstColumn() {
		gameViewModel.resetGame()

		let position1 = Position(row: 0, column: 0, player: .player1)
		let position2 = Position(row: 1, column: 0, player: .player1)
		let position3 = Position(row: 2, column: 0, player: .player1)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "X")
	}

	func test_shouldReturn_PlayerX_Won_By_Filling_SecondColumn() {
		gameViewModel.resetGame()

		let position1 = Position(row: 0, column: 1, player: .player1)
		let position2 = Position(row: 1, column: 1, player: .player1)
		let position3 = Position(row: 2, column: 1, player: .player1)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "X")
	}

	func test_shouldReturn_PlayerX_Won_By_Filling_ThirdColumn() {
		gameViewModel.resetGame()

		let position1 = Position(row: 0, column: 2, player: .player1)
		let position2 = Position(row: 1, column: 2, player: .player1)
		let position3 = Position(row: 2, column: 2, player: .player1)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "X")
	}

	func test_shouldReturn_PlayerO_Won_By_Filling_FirstColumn() {
		gameViewModel.resetGame()
		gameViewModel.switchPlayer()

		let position1 = Position(row: 0, column: 0, player: .player2)
		let position2 = Position(row: 1, column: 0, player: .player2)
		let position3 = Position(row: 2, column: 0, player: .player2)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "O")
	}

	func test_shouldReturn_PlayerO_Won_By_Filling_SecondColumn() {
		gameViewModel.resetGame()
		gameViewModel.switchPlayer()

		let position1 = Position(row: 0, column: 1, player: .player2)
		let position2 = Position(row: 1, column: 1, player: .player2)
		let position3 = Position(row: 2, column: 1, player: .player2)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "O")
	}

	func test_shouldReturn_PlayerO_Won_By_Filling_ThirdColumn() {
		gameViewModel.resetGame()
		gameViewModel.switchPlayer()

		let position1 = Position(row: 0, column: 2, player: .player2)
		let position2 = Position(row: 1, column: 2, player: .player2)
		let position3 = Position(row: 2, column: 2, player: .player2)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "O")
	}

	//--------------------------------------------------------------------------
	// MARK: - Winning logic - Primary Diagonals
	//--------------------------------------------------------------------------

	func test_shouldReturn_PlayerX_Won_By_Filling_PrimaryDiagonal() {
		gameViewModel.resetGame()

		let position1 = Position(row: 0, column: 0, player: .player1)
		let position2 = Position(row: 1, column: 1, player: .player1)
		let position3 = Position(row: 2, column: 2, player: .player1)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "X")
	}

	func test_shouldReturn_PlayerO_Won_By_Filling_PrimaryDiagonal() {
		gameViewModel.resetGame()
		gameViewModel.switchPlayer()

		let position1 = Position(row: 0, column: 0, player: .player2)
		let position2 = Position(row: 1, column: 1, player: .player2)
		let position3 = Position(row: 2, column: 2, player: .player2)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "O")
	}

	//--------------------------------------------------------------------------
	// MARK: - Winning logic - Primary Diagonals
	//--------------------------------------------------------------------------

	func test_shouldReturn_PlayerX_Won_By_Filling_AntiDiagonal() {
		gameViewModel.resetGame()

		let position1 = Position(row: 2, column: 2, player: .player1)
		let position2 = Position(row: 1, column: 1, player: .player1)
		let position3 = Position(row: 0, column: 0, player: .player1)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "X")
	}

	func test_shouldReturn_PlayerO_Won_By_Filling_AntiDiagonal() {
		gameViewModel.resetGame()
		gameViewModel.switchPlayer()

		let position1 = Position(row: 2, column: 2, player: .player2)
		let position2 = Position(row: 1, column: 1, player: .player2)
		let position3 = Position(row: 0, column: 0, player: .player2)

		updateBoard(with: [position1, position2, position3])

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(gameViewModel.currentPlayer.displayName, "O")
	}


	//--------------------------------------------------------------------------
	// MARK: - Draw game
	//--------------------------------------------------------------------------

	func test_ShouldSetGameDraw_When_AllRowsAreOccupiedButNoWin() {
		gameViewModel.resetGame()

		let position1 = Position(row: 0, column: 0, player: .player1)
		let position2 = Position(row: 0, column: 1, player: .player2)
		let position3 = Position(row: 0, column: 2, player: .player1)
		let position4 = Position(row: 1, column: 0, player: .player2)
		let position5 = Position(row: 1, column: 1, player: .player1)
		let position6 = Position(row: 1, column: 2, player: .player2)
		let position7 = Position(row: 2, column: 0, player: .player1)
		let position8 = Position(row: 2, column: 1, player: .player1)
		let position9 = Position(row: 2, column: 2, player: .player2)

		updateBoard(with: [position1, position2, position3,
						   position4, position5, position6,
						   position7, position8, position9])

		XCTAssertEqual(gameStatus, .draw)
	}

	//--------------------------------------------------------------------------
	// MARK: - Private methods
	//--------------------------------------------------------------------------

	private func updateBoard(with positions: [Position]) {
		positions.forEach({ position in
			gameViewModel.updateBoard(for: position, completion: { status in
				self.gameStatus = status
			})
		})
	}
}
