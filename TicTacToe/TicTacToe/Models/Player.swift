import Foundation

enum Player: Int {
	case player1
	case player2

	var displayName: String {
		switch self {
		case .player1:
			return "X"
		case .player2:
			return "O"
		}
	}

	var winningMessage: String {
		switch self {
		case .player1:
			return "Player X Won"
		case .player2:
			return "Player O Won"
		}
	}
}
