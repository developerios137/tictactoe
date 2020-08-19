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
		self.layer.borderColor = UIColor.black.cgColor
		self.layer.borderWidth = 1.0
	}

	//--------------------------------------------------------------------------
	// MARK: - Methods
	//--------------------------------------------------------------------------

	func configureCell(with displayText: String) {
		playerNameLabel.text = displayText
		self.backgroundColor = displayText.isEmpty ? .white : .gray
	}

	func isEmptyCell() -> Bool {
		return self.playerNameLabel.text?.isEmpty ?? true
	}
}
