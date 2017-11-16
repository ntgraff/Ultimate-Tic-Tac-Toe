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
	
	var Players = Int()
	var gameManager = GameManager()
	var x = Int()
	var y = Int()
	
    override func viewDidLoad() {
		super.viewDidLoad()
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
			default:
				winner = "error"
			}
			let alert = UIAlertController(title: "Winner", message: winner, preferredStyle: UIAlertControllerStyle.alert)
			alert.addAction(UIAlertAction(title: "dismiss", style: UIAlertActionStyle.default, handler: nil))
			present(alert, animated: true, completion: nil)
		}
	}
	
	func passBoard(x: Int, y: Int, game: Game) {
		gameManager.board[x][y] = game
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
        performSegue(withIdentifier: "SubGame", sender: self)
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
			destVC.delegate = self
        }
    }
}

