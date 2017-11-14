
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
		case none
		case x
		case o
	}
	private var player = Bool()
	private var board: [[Plr]] = [ [Plr.none, Plr.none, Plr.none], [Plr.none, Plr.none, Plr.none], [Plr.none, Plr.none, Plr.none] ]
	
	public func typeAtPoint(x:Int, y:Int) -> (type:Plr, img:UIImage) {
		var img: UIImage
		switch board[x][y] {
		case Plr.x:
			img = #imageLiteral(resourceName: "X")
		default:
			img = #imageLiteral(resourceName: "notO")
		}
		
		return (board[x][y], img)
	}
	
	public func turn(x: Int, y: Int) {
		switch player {
		case false:
			setAtPoint(x: x, y: y, type: .x)
		case true:
			setAtPoint(x: x, y: y, type: .o)
		}
	}
	
	public func setAtPoint(x:Int, y:Int, type:Plr) {
		board[x][y] = type
	}
}
