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
}
