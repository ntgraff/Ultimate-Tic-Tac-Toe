//
//  GameManager.swift
//  Ultimate Tic-Tac-Toe
//
//  Created by  on 11/14/17.
//  Copyright © 2017 Hi-Crew. All rights reserved.
//

import Foundation
class GameManager: GameParent {
	
	public var winner: Plr = .none
	
	public var board: [[Game]] = [ [Game(), Game(), Game()],
	                               [Game(), Game(), Game()],
	                               [Game(), Game(), Game()] ]
	private var player = Bool()
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
