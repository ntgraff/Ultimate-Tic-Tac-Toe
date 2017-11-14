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
	var GameArray = [Game]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		for _ in 0..<9 {
			GameArray.append(Game())
		}
	}
	@IBAction func ButtonPressed(_ sender: UIButton) {
		performSegue(withIdentifier: "SubGame", sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if (segue.identifier == "SubGame") {
			let destVC = segue.destination as! SubGameViewController
			destVC.SubGame = GameArray[0]
		}
	}
}

