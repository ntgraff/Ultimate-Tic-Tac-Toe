//
//  GameParent.swift
//  Ultimate Tic-Tac-Toe
//
//  Created by  on 11/16/17.
//  Copyright © 2017 Hi-Crew. All rights reserved.
//

import Foundation

class GameParent {
	enum Plr:Int{
		case none = 0
		case x = 1
		case o = 2
		case neither = 3
	}
	public var winningCombos: [[(x: Int, y: Int)]] = [ [ (0, 0), (1, 0), (2, 0) ],  // across the top
														[ (0, 1), (1, 1), (2, 1) ],  // across the middle
														[ (0, 2), (1, 2), (2, 2) ],  // across the bottom
														[ (0, 0), (0, 1), (0, 2) ],  // down the left
														[ (1, 0), (1, 1), (1, 2) ],  // down the middle
														[ (2, 0), (2, 1), (2, 2) ],  // down the right
														[ (0, 0), (1, 1), (2, 2) ],  // top left to bottom right
														[ (2, 0), (1, 1), (0, 2) ] ] // top right to bottom left
}
