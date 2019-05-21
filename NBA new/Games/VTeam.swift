/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct VTeam : Codable {
	let teamId : String?
	let triCode : String?
	let win : String?
	let loss : String?
	let seriesWin : String?
	let seriesLoss : String?
	let score : String?
	let linescore : [Linescore]?

	enum CodingKeys: String, CodingKey {

		case teamId = "teamId"
		case triCode = "triCode"
		case win = "win"
		case loss = "loss"
		case seriesWin = "seriesWin"
		case seriesLoss = "seriesLoss"
		case score = "score"
		case linescore = "linescore"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		teamId = try values.decodeIfPresent(String.self, forKey: .teamId)
		triCode = try values.decodeIfPresent(String.self, forKey: .triCode)
		win = try values.decodeIfPresent(String.self, forKey: .win)
		loss = try values.decodeIfPresent(String.self, forKey: .loss)
		seriesWin = try values.decodeIfPresent(String.self, forKey: .seriesWin)
		seriesLoss = try values.decodeIfPresent(String.self, forKey: .seriesLoss)
		score = try values.decodeIfPresent(String.self, forKey: .score)
		linescore = try values.decodeIfPresent([Linescore].self, forKey: .linescore)
	}

}