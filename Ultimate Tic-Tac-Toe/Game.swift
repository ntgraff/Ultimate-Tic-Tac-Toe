
//
//  Game.swift
//  Ultimate Tic-Tac-Toe
//
//  Created by  on 11/10/17.
//  Copyright © 2017 Hi-Crew. All rights reserved.
//

import Foundation
import UIKit

class Game: GameParent {

	public var winner: Plr = .none
	private var player = Bool()
	private var board: [[Plr]] = [ [Plr.none, Plr.none, Plr.none],
	                               [Plr.none, Plr.none, Plr.none],
	                               [Plr.none, Plr.none, Plr.none] ]
	
	public func typeAtPoint(x:Int, y:Int) -> (type:Plr, img:UIImage) {
		var img: UIImage
		switch board[x][y] {
		case .x:
			img = #imageLiteral(resourceName: "X128")
		case .o:
			img = #imageLiteral(resourceName: "notO128")
		default:
			img = UIImage()
		}
		
		return (board[x][y], img)
	}
	
	public func turn(x: Int, y: Int) {
		if (board[x][y] == .none) {
			switch player {
			case false:
				setAtPoint(x: x, y: y, type: .x)
			case true:
				setAtPoint(x: x, y: y, type: .o)
			}
		
			player = !player
		}
		winner = checkForVictory()
	}
	
	public func setAtPoint(x:Int, y:Int, type:Plr) {
		board[x][y] = type
	}
	
	private func checkForVictory() -> Plr {
		for combo in winningCombos {
			var row: [Plr] = []
			for space in combo {
				row.append(board[space.x][space.y])
			}
			if (row[0] != .none && row[0] == row[1] && row[1] == row[2]) {
				return row[0]
			}
		}
		return Plr.none
	}
}
