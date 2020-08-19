import UIKit

fileprivate struct Constants {
	static let gameCellReuseIdentifier = "GameCollectionViewCell"
	static let emptyString = ""
}

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
		self.configureView()
		self.initializeGame()
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

extension GameViewController: UICollectionViewDataSource {

	//--------------------------------------------------------------------------
	// MARK: - CollectionView Data source methods
	//--------------------------------------------------------------------------

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		gameViewModel.gridSize
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		gameViewModel.gridSize
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.gameCellReuseIdentifier, for: indexPath) as! GameCollectionViewCell
		cell.configureCell(with: Constants.emptyString)
		return cell
	}
}

extension GameViewController: UICollectionViewDelegate {

	//--------------------------------------------------------------------------
	// MARK: - Collection view delegate methods
	//--------------------------------------------------------------------------

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath) as! GameCollectionViewCell

		guard cell.isEmptyCell() else {
			return
		}

		let position = Position(row: indexPath.row, column: indexPath.section, player: gameViewModel.currentPlayer)

		cell.configureCell(with: gameViewModel.currentPlayer.displayName)

		gameViewModel.updateBoard(for: position) { [weak self] status in
			switch status {
				case .won:
					//TODO: handle winning
					break
				case .draw:
					//TODO: handle draw
					break
				case .progress:
					self?.updateView()
			}
		}
	}
}
