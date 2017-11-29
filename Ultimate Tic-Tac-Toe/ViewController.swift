//
//  ViewController.swift
//  Ultimate Tic-Tac-Toe
//
//  Created by  on 11/10/17.
//  Copyright © 2017 Hi-Crew. All rights reserved.
//

import UIKit

class ViewController: UIViewController, VCMainDelegate {
	
	@IBOutlet var buttons: [UIButton]!
	
	
	var imageCollections = [[UIImageView]]()
    @IBOutlet var imageCollectionTopLeft: [UIImageView]!
    @IBOutlet var imageCollectionTopMiddle: [UIImageView]!
    @IBOutlet var imageCollectionTopRight: [UIImageView]!
    @IBOutlet var imageCollectionMiddleLeft: [UIImageView]!
    @IBOutlet var imageCollectionMiddleMiddle: [UIImageView]!
    @IBOutlet var imageCollectionMiddleRight: [UIImageView]!
    @IBOutlet var imageCollectionBottomLeft: [UIImageView]!
    @IBOutlet var imageCollectionBottomMiddle: [UIImageView]!
    @IBOutlet var imageCollectionBottomRight: [UIImageView]!
	
	var Players = Int()
	var gameManager = GameManager()
	var x = Int()
	var y = Int()
	var toBoard: (x: Int, y:Int) = (1, 1)
	
    override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor(red: CGFloat(0.3), green: CGFloat(0.3), blue: CGFloat(0.3), alpha: CGFloat(1))
		imageCollections = [ imageCollectionTopLeft, imageCollectionTopMiddle, imageCollectionTopRight, imageCollectionMiddleLeft, imageCollectionMiddleMiddle, imageCollectionMiddleRight, imageCollectionBottomLeft, imageCollectionBottomMiddle, imageCollectionBottomRight ]
    }
	
	override func viewWillAppear(_ animated: Bool) {
		loadGame()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		if(gameManager.checkForVictory() != .none) {
			var winner = String()
			switch(gameManager.winner)
			{
			case .x:
				winner = "X"
			case .o:
				winner = "O"
			case .neither:
				winner = "Nobody"
			default:
				winner = "Error"
			}
			let alert = UIAlertController(title: "Winner", message: winner, preferredStyle: UIAlertControllerStyle.alert)
			alert.addAction(UIAlertAction(title: "Main Menu", style: UIAlertActionStyle.default, handler: { action in
				self.dismiss(animated: true, completion: nil)
			}))
			present(alert, animated: true, completion: nil)
		}
	}
	
	func loadGame() {
		for col in imageCollections.indices {
			// set the x and o's of the sub games
			for image in imageCollections[col].indices {
				imageCollections[col][image].image = gameManager.board[col % 3][col / 3].typeAtPoint(x: image  % 3, y: image / 3).img
			}
		}
		// set button tint
		if (gameManager.board[toBoard.x][toBoard.y].winner == .none) {
			for button in buttons.indices {
				buttons[button].setImage(gameManager.imageAtPoint(x: button % 3, y: button / 3), for: UIControlState.normal)
				if (toBoard.x != button % 3 || toBoard.y != button / 3) {
					buttons[button].backgroundColor = UIColor(red: CGFloat(1), green: CGFloat(1), blue: CGFloat(1), alpha: CGFloat(0.0))
				}
				else {
					buttons[button].backgroundColor = UIColor(red: CGFloat(1), green: CGFloat(1), blue: CGFloat(1), alpha: CGFloat(0.3))
				}
			}
		}
		else {
			for button in buttons.indices {
				buttons[button].setImage(gameManager.imageAtPoint(x: button % 3, y: button / 3), for: UIControlState.normal)
				if (gameManager.board[button % 3][button / 3].winner == .none) {
					buttons[button].backgroundColor = UIColor(red: CGFloat(1), green: CGFloat(1), blue: CGFloat(1), alpha: CGFloat(0.3))
				}
				else {
					buttons[button].backgroundColor = UIColor(red: CGFloat(1), green: CGFloat(1), blue: CGFloat(1), alpha: CGFloat(0.0))
				}
			}
		}
	}
		
	
	func passBoard(x: Int, y: Int, game: Game, toBoardX: Int, toBoardY: Int, player: Bool) {
		gameManager.board[x][y] = game
		gameManager.player = player
		toBoard.x = toBoardX
		toBoard.y = toBoardY
		print("game sent back")
	}
	
    @IBAction func ButtonPressed(_ sender: UIButton) {
        x = 0
        y = 0
		for i in buttons.indices {
			if (sender == buttons[i]) {
				x = i % 3
				y = i / 3
				break;
			}
		}
		if (buttons[x + 3 * y].backgroundColor == UIColor(red: CGFloat(1), green: CGFloat(1), blue: CGFloat(1), alpha: CGFloat(0.3))) {
			performSegue(withIdentifier: "SubGame", sender: self)
		}
    }
    
	@IBAction func buttonQuit(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SubGame") {
            let destVC = segue.destination as! SubGameViewController
            destVC.SubGame = gameManager.board[x][y]
			destVC.boardX = x
			destVC.boardY = y
			destVC.SubGame.player = gameManager.player
			destVC.delegate = self
        }
    }
}

