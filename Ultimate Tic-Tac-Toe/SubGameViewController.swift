//
//  SubGameViewController.swift
//  Ultimate Tic-Tac-Toe
//
//  Created by  on 11/10/17.
//  Copyright © 2017 Hi-Crew. All rights reserved.
//

import UIKit

protocol VCMainDelegate {
	func passBoard(x: Int, y: Int, game: Game, toBoardX: Int, toBoardY: Int)
}

class SubGameViewController: UIViewController {
	var delegate: VCMainDelegate?
	@IBOutlet weak var buttonTopLeft: UIButton!
	@IBOutlet weak var buttonTopMiddle: UIButton!
	@IBOutlet weak var buttonTopRight: UIButton!
	@IBOutlet weak var buttonMiddleLeft: UIButton!
	@IBOutlet weak var buttonMiddleMiddle: UIButton!
	@IBOutlet weak var buttonMiddleRight: UIButton!
	@IBOutlet weak var buttonBottomLeft: UIButton!
	@IBOutlet weak var buttonBottomMiddle: UIButton!
	@IBOutlet weak var buttonBottomRight: UIButton!
	
	var SubGame = Game()
	var boardX = Int()
	var boardY = Int()
	
	func loadGame() {
		buttonTopLeft.setImage(SubGame.typeAtPoint(x: 0, y: 0).img, for: UIControlState.normal)
		buttonTopMiddle.setImage(SubGame.typeAtPoint(x: 1, y: 0).img, for: UIControlState.normal)
		buttonTopRight.setImage(SubGame.typeAtPoint(x: 2, y: 0).img, for: UIControlState.normal)
		buttonMiddleLeft.setImage(SubGame.typeAtPoint(x: 0, y: 1).img, for: UIControlState.normal)
		buttonMiddleMiddle.setImage(SubGame.typeAtPoint(x: 1, y: 1).img, for: UIControlState.normal)
		buttonMiddleRight.setImage(SubGame.typeAtPoint(x: 2, y: 1).img, for: UIControlState.normal)
		buttonBottomLeft.setImage(SubGame.typeAtPoint(x: 0, y: 2).img, for: UIControlState.normal)
		buttonBottomMiddle.setImage(SubGame.typeAtPoint(x: 1, y: 2).img, for: UIControlState.normal)
		buttonBottomRight.setImage(SubGame.typeAtPoint(x: 2, y: 2).img, for: UIControlState.normal)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		loadGame()
        // Do any additional setup after loading the view.
    }
	
    @IBAction func subButtonPressed(_ sender: UIButton) {
		var x: Int = 0
		var y: Int = 0
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
		SubGame.turn(x: x, y: y)
		sender.setImage(SubGame.typeAtPoint(x: x, y: y).img, for: UIControlState.normal)
		if(SubGame.winner != .none) {
			switch(SubGame.winner)
			{
			case .x, .o:
				delegate?.passBoard(x: boardX, y: boardY, game: SubGame, toBoardX: x, toBoardY: y)
				self.dismiss(animated: true, completion: nil)
			case .neither:
				delegate?.passBoard(x: boardX, y: boardY, game: Game(), toBoardX: x, toBoardY: y)
				self.dismiss(animated: true, completion: nil)
			default:
				delegate?.passBoard(x: boardX, y: boardY, game: SubGame, toBoardX: <#T##Int#>, toBoardY: <#T##Int#>)
				break
			}
		}
    }
    @IBAction func backToMainGame(_ sender: UIButton) {
		delegate?.passBoard(x: boardX, y: boardY, game: SubGame, toBoardX: nil, toBoardY: nil)
		self.dismiss(animated: true, completion: nil)
	}
}
