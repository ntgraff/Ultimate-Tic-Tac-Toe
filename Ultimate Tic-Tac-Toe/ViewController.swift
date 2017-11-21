//
//  ViewController.swift
//  Ultimate Tic-Tac-Toe
//
//  Created by  on 11/10/17.
//  Copyright © 2017 Hi-Crew. All rights reserved.
//

import UIKit

class ViewController: UIViewController, VCMainDelegate {
	@IBOutlet weak var buttonTopLeft: UIButton!
	@IBOutlet weak var buttonTopMiddle: UIButton!
	@IBOutlet weak var buttonTopRight: UIButton!
	@IBOutlet weak var buttonMiddleLeft: UIButton!
	@IBOutlet weak var buttonMiddleMiddle: UIButton!
	@IBOutlet weak var buttonMiddleRight: UIButton!
	@IBOutlet weak var buttonBottomLeft: UIButton!
	@IBOutlet weak var buttonBottomMiddle: UIButton!
	@IBOutlet weak var buttonBottomRight: UIButton!
	
	var buttonArray = [UIButton]()
	
    @IBOutlet var imageCollectionTopLeft: [UIImageView]!
    @IBOutlet var imageCollectionTopMiddle: [UIImageView]!
    @IBOutlet var imageCollectionTopRight: [UIImageView]!
    @IBOutlet var imageCollectionMiddleLeft: [UIImageView]!
    @IBOutlet var imageCollectionMiddleMiddle: [UIImageView]!
    @IBOutlet var imageCollectionMiddleRight: [UIImageView]!
    @IBOutlet var imageCollectionBottomLeft: [UIImageView]!
    @IBOutlet var imageCollectionBottomMiddle: [UIImageView]!
    @IBOutlet var imageCollectionBottomRight: [UIImageView]!
	
	var imageCollections = [[UIImageView]]()
    
	var Players = Int()
	var gameManager = GameManager()
	var x = Int()
	var y = Int()
	var toBoard: (x: Int, y:Int) = (1, 1)
	
    override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor(red: CGFloat(0.3), green: CGFloat(0.3), blue: CGFloat(0.3), alpha: CGFloat(1))
		imageCollections = [ imageCollectionTopLeft, imageCollectionTopMiddle, imageCollectionTopRight, imageCollectionMiddleLeft, imageCollectionMiddleMiddle, imageCollectionMiddleRight, imageCollectionBottomLeft, imageCollectionBottomMiddle, imageCollectionBottomRight ]
		buttonArray = [ buttonTopLeft, buttonTopMiddle, buttonTopRight, buttonMiddleLeft, buttonMiddleMiddle, buttonMiddleRight, buttonBottomLeft, buttonBottomMiddle, buttonBottomRight ]
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
			for image in imageCollections[col].indices {
				if (!(toBoard.x == col % 3) || !(toBoard.y == col / 3)) {
					buttonArray[col].backgroundColor = UIColor(red: CGFloat(1), green: CGFloat(1), blue: CGFloat(1), alpha: CGFloat(0.0))
					
				}
				else {
					buttonArray[col].backgroundColor = UIColor(red: CGFloat(1), green: CGFloat(1), blue: CGFloat(1), alpha: CGFloat(0.3))
				}
				imageCollections[col][image].image = gameManager.board[col % 3][col / 3].typeAtPoint(x: image  % 3, y: image / 3).img
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
        if (sender == buttonTopLeft) {
            x = 0
            y = 0
        }
        else if (sender == buttonTopMiddle) {
            x = 1
            y = 0
        }
        else if (sender == buttonTopRight) {
            x = 2
            y = 0
        }
        else if (sender == buttonMiddleLeft) {
            x = 0
            y = 1
        }
        else if (sender == buttonMiddleMiddle) {
            x = 1
            y = 1
        }
        else if (sender == buttonMiddleRight) {
            x = 2
            y = 1
        }
        else if (sender == buttonBottomLeft) {
            x = 0
            y = 2
        }
        else if (sender == buttonBottomMiddle) {
            x = 1
            y = 2
        }
        else if (sender == buttonBottomRight) {
            x = 2
            y = 2
        }
		if (buttonArray[x + 3 * y].backgroundColor == UIColor(red: CGFloat(1), green: CGFloat(1), blue: CGFloat(1), alpha: CGFloat(0.3))) {
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

