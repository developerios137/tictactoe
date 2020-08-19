import UIKit

typealias AnyFunction = () -> Void

fileprivate struct Constants {
	static let gameCellReuseIdentifier = "GameCollectionViewCell"
	static let emptyString = ""
	static let alertGameEnd = "Game Over"
	static let alertGameDraw = "It's a draw"
	static let alertRestart = "Ok Restart"
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
		configureView()
		initializeGame()
	}
}

private extension GameViewController {

	//--------------------------------------------------------------------------
	// MARK: - IB Actions
	//--------------------------------------------------------------------------

	@IBAction func gridSizeButtonTapped(_ sender: Any) {
	}

	@IBAction func resetButtonTapped(_ sender: Any) {
		resetGame()
	}
}

private extension GameViewController {

//--------------------------------------------------------------------------
// MARK: - Private methods
//--------------------------------------------------------------------------

	func initializeGame() {
		gameViewModel.resetGame()
		gameCollectionView.reloadData()
		updateView()
	}

	func configureView() {
		gameCollectionView.collectionViewLayout = flowLayout
		updateView()
	}

	func updateView() {
		currentPlayerLabel.text = gameViewModel.currentPlayer.displayName
	}

	func resetGame() {
		initializeGame()
	}

	func showAlertMessage(_ title: String,_ message: String?, _ actionButtonTitle: String, actionSelector:AnyFunction?) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle:UIAlertController.Style.alert)
		alertController.addAction(UIAlertAction(title: actionButtonTitle, style: UIAlertAction.Style.default)
		{ action -> Void in
			if let act = actionSelector {
				act()
			}
		})
		present(alertController, animated: true, completion: nil)
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
					self?.showAlertMessage(Constants.alertGameEnd, self?.gameViewModel.currentPlayer.winningMessage, Constants.alertRestart, actionSelector: self?.resetGame)
				case .draw:
					self?.showAlertMessage(Constants.alertGameEnd, Constants.alertGameDraw, Constants.alertRestart, actionSelector: self?.resetGame)
				case .progress:
					self?.updateView()
			}
		}
	}
}
