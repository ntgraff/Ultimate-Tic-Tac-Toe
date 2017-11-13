
//
//  Game.swift
//  Ultimate Tic-Tac-Toe
//
//  Created by  on 11/10/17.
//  Copyright © 2017 Hi-Crew. All rights reserved.
//

import Foundation
import UIKit

class Game {
	enum Plr:Int{
		case none = 0
		case x = 1
		case o = 2
	}
	private var board: [[Int]] = [ [0, 0, 0], [0, 0, 0], [0, 0, 0] ]
	
	
	public func typeAtPoint(x:Int, y:Int) -> (type:Int, img:UIImage) {
		var img: UIImage
		switch board[x][y] {
		case Int(Float((Plr.x).rawValue)):
			img = #imageLiteral(resourceName: "X")
		default:
			img = #imageLiteral(resourceName: "notO")
		}
		
		return (board[x][y], img)
	}
	
	public func setAtPoint(x:Int, y:Int, type:Plr) {
		board[x][y] = Int(Float((type).rawValue))
	}
}
