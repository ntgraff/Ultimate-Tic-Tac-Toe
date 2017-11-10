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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	@IBAction func ButtonPressed(_ sender: UIButton) {
		performSegue(withIdentifier: "SubGame", sender: self)
	}
}

