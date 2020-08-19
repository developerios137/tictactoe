import Foundation

struct Position {
	let row: Int
	let column: Int
	let player: Player

	init(row: Int, column: Int, player: Player) {
		self.row = row
		self.column = column
		self.player = player
	}
}
