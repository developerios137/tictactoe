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
}
