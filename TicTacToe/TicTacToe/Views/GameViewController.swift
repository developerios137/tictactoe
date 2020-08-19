import UIKit

class GameViewController: UIViewController {

	//--------------------------------------------------------------------------
	// MARK: - IB outlets
	//--------------------------------------------------------------------------

	@IBOutlet weak var gameCollectionView: UICollectionView!
	@IBOutlet weak var currentPlayerLabel: UILabel!

	//--------------------------------------------------------------------------
	// MARK: - Properties
	//--------------------------------------------------------------------------

	private lazy var flowLayout: UICollectionViewFlowLayout = {
		let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
		return flowLayout
	}()

	private let gameViewModel = GameViewModel()

	//--------------------------------------------------------------------------
	// MARK: - View lifecycle
	//--------------------------------------------------------------------------

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

private extension GameViewController {

	//--------------------------------------------------------------------------
	// MARK: - IB Actions
	//--------------------------------------------------------------------------

	@IBAction func gridSizeButtonTapped(_ sender: Any) {
	}

	@IBAction func resetButtonTapped(_ sender: Any) {
	}
}

private extension GameViewController {

//--------------------------------------------------------------------------
// MARK: - Private methods
//--------------------------------------------------------------------------

	func initializeGame() {
		gameViewModel.resetGame()
		self.gameCollectionView.reloadData()
		self.updateView()
	}

	func configureView() {
		self.gameCollectionView.collectionViewLayout = flowLayout
		self.updateView()
	}

	func updateView() {
		self.currentPlayerLabel.text = gameViewModel.currentPlayer.displayName
	}

	func resetGame() {
		self.initializeGame()
	}
}

