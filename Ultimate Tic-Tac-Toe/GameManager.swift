//
//  GameManager.swift
//  Ultimate Tic-Tac-Toe
//
//  Created by  on 11/14/17.
//  Copyright © 2017 Hi-Crew. All rights reserved.
//

import Foundation
import UIKit

class GameManager: GameParent {
	
	public var winner: Plr = .none
	public var player = Bool()
	public var board: [[Game]] = [ [Game(), Game(), Game()],
	                               [Game(), Game(), Game()],
	                               [Game(), Game(), Game()] ]
	public func imageAtPoint(x: Int, y:Int) -> UIImage {
		switch(board[x][y].winner) {
		case .x:
			return #imageLiteral(resourceName: "X128")
		case .o:
			return #imageLiteral(resourceName: "notO128")
		default:
			return UIImage()
		}
	}
		
	public func checkForVictory() -> Plr {
		var count: Int = 0
		for combo in winningCombos {
			var row: [Game] = []
			for space in combo {
				row.append(board[space.x][space.y])
			}
			if (row[0].winner != .none && row[0].winner == row[1].winner && row[1].winner == row[2].winner) {
				winner = row[0].winner
				return row[0].winner
			}
			count += 1
			if (count >= 9) {
				winner = Plr.neither
				return Plr.neither
			}
		}
		winner = Plr.none
		return Plr.none
	}
	
}
