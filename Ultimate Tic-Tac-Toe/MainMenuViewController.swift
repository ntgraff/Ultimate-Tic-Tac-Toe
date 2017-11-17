//
//  MainMenuViewController.swift
//  Ultimate Tic-Tac-Toe
//
//  Created by  on 11/10/17.
//  Copyright © 2017 Hi-Crew. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		// Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "OnePlayer") {
            let destVC = segue.destination as! ViewController
            destVC.Players = 0;
        } else if (segue.identifier == "TwoPlayer") {
            let destVC = segue.destination as! ViewController
            destVC.Players = 1;
        }
    }
}
