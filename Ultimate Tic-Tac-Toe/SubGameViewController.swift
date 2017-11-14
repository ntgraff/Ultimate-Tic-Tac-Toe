//
//  SubGameViewController.swift
//  Ultimate Tic-Tac-Toe
//
//  Created by  on 11/10/17.
//  Copyright © 2017 Hi-Crew. All rights reserved.
//

import UIKit

class SubGameViewController: UIViewController {
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
	var Turn = Int()
	
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    @IBAction func backToMainGame(_ sender: UIButton) {
    
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BackToMainGame" {
            let mgvc = segue.destination as! ViewController
            mgvc.Turn = Turn
        }
    }

}
