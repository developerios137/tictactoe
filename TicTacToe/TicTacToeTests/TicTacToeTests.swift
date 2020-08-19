import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {

	private var gameViewModel: GameViewModel!
	
    override func setUp() {
		gameViewModel = GameViewModel()
    }

    override func tearDown() {
		gameViewModel = nil
    }

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

		gameViewModel.updateBoard(for: position, completion: {_ in })

		XCTAssertEqual(gameViewModel.filledTilesCounter, 1)
	}

	func test_shouldReturn_PlayerX_Won_By_Filling_TopRow() {
		var gameStatus: GameStatus!

		gameViewModel.resetGame()

		let position1 = Position(row: 0, column: 0, player: .player1)
		let position2 = Position(row: 0, column: 1, player: .player1)
		let position3 = Position(row: 0, column: 2, player: .player1)

		gameViewModel.updateBoard(for: position1, completion: {_ in })
		gameViewModel.updateBoard(for: position2, completion: {_ in })
		gameViewModel.updateBoard(for: position3, completion: { status in
			gameStatus = status
		})

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(self.gameViewModel.currentPlayer.displayName, "X")
	}

	func test_shouldReturn_PlayerX_Won_By_Filling_MiddleRow() {
		var gameStatus: GameStatus!

		gameViewModel.resetGame()

		let position1 = Position(row: 1, column: 0, player: .player1)
		let position2 = Position(row: 1, column: 1, player: .player1)
		let position3 = Position(row: 1, column: 2, player: .player1)

		gameViewModel.updateBoard(for: position1, completion: {_ in })
		gameViewModel.updateBoard(for: position2, completion: {_ in })
		gameViewModel.updateBoard(for: position3, completion: { status in
			gameStatus = status
		})

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(self.gameViewModel.currentPlayer.displayName, "X")
	}

	func test_shouldReturn_PlayerX_Won_By_Filling_BottomRow() {
		var gameStatus: GameStatus!

		gameViewModel.resetGame()

		let position1 = Position(row: 2, column: 0, player: .player1)
		let position2 = Position(row: 2, column: 1, player: .player1)
		let position3 = Position(row: 2, column: 2, player: .player1)
		gameViewModel.updateBoard(for: position1, completion: {_ in })
		gameViewModel.updateBoard(for: position2, completion: {_ in })
		gameViewModel.updateBoard(for: position3, completion: { status in
			gameStatus = status
		})

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(self.gameViewModel.currentPlayer.displayName, "X")
	}

	func test_shouldReturn_PlayerO_Won_By_Filling_TopRow() {
		var gameStatus: GameStatus!

		gameViewModel.resetGame()
		gameViewModel.switchPlayer()

		let position1 = Position(row: 0, column: 0, player: .player2)
		let position2 = Position(row: 0, column: 1, player: .player2)
		let position3 = Position(row: 0, column: 2, player: .player2)

		gameViewModel.updateBoard(for: position1, completion: {_ in })
		gameViewModel.updateBoard(for: position2, completion: {_ in })
		gameViewModel.updateBoard(for: position3, completion: { status in
			gameStatus = status
		})

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(self.gameViewModel.currentPlayer.displayName, "O")
	}

	func test_shouldReturn_PlayerO_Won_By_Filling_MiddleRow() {
		var gameStatus: GameStatus!

		gameViewModel.resetGame()
		gameViewModel.switchPlayer()

		let position1 = Position(row: 1, column: 0, player: .player2)
		let position2 = Position(row: 1, column: 1, player: .player2)
		let position3 = Position(row: 1, column: 2, player: .player2)

		gameViewModel.updateBoard(for: position1, completion: {_ in })
		gameViewModel.updateBoard(for: position2, completion: {_ in })
		gameViewModel.updateBoard(for: position3, completion: { status in
			gameStatus = status
		})

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(self.gameViewModel.currentPlayer.displayName, "O")
	}

	func test_shouldReturn_PlayerO_Won_By_Filling_BottomRow() {
		var gameStatus: GameStatus!

		gameViewModel.resetGame()
		gameViewModel.switchPlayer()

		let position1 = Position(row: 2, column: 0, player: .player2)
		let position2 = Position(row: 2, column: 1, player: .player2)
		let position3 = Position(row: 2, column: 2, player: .player2)
		gameViewModel.updateBoard(for: position1, completion: {_ in })
		gameViewModel.updateBoard(for: position2, completion: {_ in })
		gameViewModel.updateBoard(for: position3, completion: { status in
			gameStatus = status
		})

		XCTAssertEqual(gameStatus, .won)
		XCTAssertEqual(self.gameViewModel.currentPlayer.displayName, "O")
	}
}
