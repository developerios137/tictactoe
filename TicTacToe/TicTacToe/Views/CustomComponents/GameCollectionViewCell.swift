import UIKit

class GameCollectionViewCell: UICollectionViewCell {

	//--------------------------------------------------------------------------
	// MARK: - IB outlets
	//--------------------------------------------------------------------------
    
	@IBOutlet weak var playerNameLabel: UILabel!

	//--------------------------------------------------------------------------
	// MARK: - Override methods
	//--------------------------------------------------------------------------

	override func prepareForReuse() {
		super.prepareForReuse()
		playerNameLabel.text = ""
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		layer.borderColor = UIColor.black.cgColor
		layer.borderWidth = 1.0
	}

	//--------------------------------------------------------------------------
	// MARK: - Methods
	//--------------------------------------------------------------------------

	func configureCell(with displayText: String) {
		playerNameLabel.text = displayText
		backgroundColor = displayText.isEmpty ? .white : .gray
	}

	func isEmptyCell() -> Bool {
		return playerNameLabel.text?.isEmpty ?? true
	}
}
