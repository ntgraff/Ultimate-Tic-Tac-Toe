//
//  SubGameViewController.swift
//  Ultimate Tic-Tac-Toe
//
//  Created by  on 11/10/17.
//  Copyright © 2017 Hi-Crew. All rights reserved.
//

import UIKit

protocol VCMainDelegate {
	func passBoard(x: Int, y: Int, game: Game, toBoardX: Int, toBoardY: Int, player: Bool)
}

class SubGameViewController: UIViewController {
	var delegate: VCMainDelegate?
	
	@IBOutlet var buttons: [UIButton]!
	
	var SubGame = Game()
	var boardX = Int()
	var boardY = Int()
	
	func loadGame() {
		for i in buttons.indices {
			buttons[i].setImage(SubGame.typeAtPoint(x: i % 3, y: i / 3).img, for: UIControlState.normal)
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor(red: CGFloat(0.6), green: CGFloat(0.6), blue: CGFloat(0.6), alpha: CGFloat(1))
		loadGame()
        // Do any additional setup after loading the view.
    }
	
    @IBAction func subButtonPressed(_ sender: UIButton) {
		var x: Int = 0
		var y: Int = 0
		for i in buttons.indices {
			if (sender == buttons[i]) {
				x = i % 3;
				y = i / 3;
				break;
			}
		}
		if (SubGame.typeAtPoint(x: x, y: y).type == .none) {
			SubGame.turn(x: x, y: y)
			sender.setImage(SubGame.typeAtPoint(x: x, y: y).img, for: UIControlState.normal)
			delegate?.passBoard(x: boardX, y: boardY, game: SubGame, toBoardX: x, toBoardY: y, player: SubGame.player)
			self.dismiss(animated: true, completion: nil)
		}
    }
}
