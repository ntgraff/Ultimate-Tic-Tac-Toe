//
//  ViewController.swift
//  Ultimate Tic-Tac-Toe
//
//  Created by  on 11/10/17.
//  Copyright © 2017 Hi-Crew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
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
	var game = GameManager()
	var x = Int()
	var y = Int()
    
    override func viewDidLoad() {
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SubGame") {
            let destVC = segue.destination as! SubGameViewController
            destVC.SubGame = game.board[x][y]
			destVC.boardX = x
			destVC.boardY = y
        }
    }
}

