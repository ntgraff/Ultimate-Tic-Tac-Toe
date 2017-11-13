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
    var Turn = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	@IBAction func ButtonPressed(_ sender: UIButton) {
		performSegue(withIdentifier: "SubGame", sender: self)
	}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SubGame" {
            let sgvc = segue.destination as! SubGameViewController
            sgvc.Turn = Turn
        }
    }
}

