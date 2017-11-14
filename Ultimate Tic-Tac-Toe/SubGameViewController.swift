//
//  SubGameViewController.swift
//  Ultimate Tic-Tac-Toe
//
//  Created by  on 11/10/17.
//  Copyright © 2017 Hi-Crew. All rights reserved.
//

import UIKit

class SubGameViewController: UIViewController {
	var SubGame = Game()
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func subButtonPressed(_ sender: UIButton) {
		SubGame.setAtPoint(x: 0, y: 0, type: .o)
		let img = SubGame.typeAtPoint(x: 0, y: 0).img
		
		sender.setImage(img, for: UIControlState.normal)
    }
    @IBAction func backToMainGame(_ sender: UIButton) {
    
    
    }
    
}
