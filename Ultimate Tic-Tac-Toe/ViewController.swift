//
//  ViewController.swift
//  Ultimate Tic-Tac-Toe
//
//  Created by  on 11/10/17.
//  Copyright © 2017 Hi-Crew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var Players = Int()
	var game = GameManager()
	var Turn = Int()
	
	override func viewDidLoad() {
		
	}
	@IBAction func ButtonPressed(_ sender: UIButton) {
		performSegue(withIdentifier: "SubGame", sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if (segue.identifier == "SubGame") {
			let destVC = segue.destination as! SubGameViewController
			var x: Int = 0
			var y: Int = 0
//			if (sender == buttonTopLeft) {
//				x = 0
//				y = 0
//			}
//			else if (sender == buttonTopMiddle) {
//				x = 1
//				y = 0
//			}
//			else if (sender == buttonTopRight) {
//				x = 2
//				y = 0
//			}
//			else if (sender == buttonMiddleLeft) {
//				x = 0
//				y = 1
//			}
//			else if (sender == buttonMiddleMiddle) {
//				x = 1
//				y = 1
//			}
//			else if (sender == buttonMiddleRight) {
//				x = 2
//				y = 1
//			}
//			else if (sender == buttonBottomLeft) {
//				x = 0
//				y = 2
//			}
//			else if (sender == buttonBottomMiddle) {
//				x = 1
//				y = 2
//			}
//			else if (sender == buttonBottomRight) {
//				x = 2
//				y = 2
//			}
			destVC.SubGame = game.board[x][y]
		}
	}
}

