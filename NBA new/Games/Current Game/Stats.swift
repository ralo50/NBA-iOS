/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Stats : Codable {
	let points : String?
	let field_goals_made : String?
	let field_goals_attempted : String?
	let field_goals_percentage : String?
	let free_throws_made : String?
	let free_throws_attempted : String?
	let free_throws_percentage : String?
	let three_pointers_made : String?
	let three_pointers_attempted : String?
	let three_pointers_percentage : String?
	let rebounds_offensive : String?
	let rebounds_defensive : String?
	let team_rebounds : String?
	let assists : String?
	let fouls : String?
	let team_fouls : String?
	let technical_fouls : String?
	let steals : String?
	let turnovers : String?
	let team_turnovers : String?
	let blocks : String?
	let short_timeout_remaining : String?
	let full_timeout_remaining : String?

	enum CodingKeys: String, CodingKey {

		case points = "points"
		case field_goals_made = "field_goals_made"
		case field_goals_attempted = "field_goals_attempted"
		case field_goals_percentage = "field_goals_percentage"
		case free_throws_made = "free_throws_made"
		case free_throws_attempted = "free_throws_attempted"
		case free_throws_percentage = "free_throws_percentage"
		case three_pointers_made = "three_pointers_made"
		case three_pointers_attempted = "three_pointers_attempted"
		case three_pointers_percentage = "three_pointers_percentage"
		case rebounds_offensive = "rebounds_offensive"
		case rebounds_defensive = "rebounds_defensive"
		case team_rebounds = "team_rebounds"
		case assists = "assists"
		case fouls = "fouls"
		case team_fouls = "team_fouls"
		case technical_fouls = "technical_fouls"
		case steals = "steals"
		case turnovers = "turnovers"
		case team_turnovers = "team_turnovers"
		case blocks = "blocks"
		case short_timeout_remaining = "short_timeout_remaining"
		case full_timeout_remaining = "full_timeout_remaining"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		points = try values.decodeIfPresent(String.self, forKey: .points)
		field_goals_made = try values.decodeIfPresent(String.self, forKey: .field_goals_made)
		field_goals_attempted = try values.decodeIfPresent(String.self, forKey: .field_goals_attempted)
		field_goals_percentage = try values.decodeIfPresent(String.self, forKey: .field_goals_percentage)
		free_throws_made = try values.decodeIfPresent(String.self, forKey: .free_throws_made)
		free_throws_attempted = try values.decodeIfPresent(String.self, forKey: .free_throws_attempted)
		free_throws_percentage = try values.decodeIfPresent(String.self, forKey: .free_throws_percentage)
		three_pointers_made = try values.decodeIfPresent(String.self, forKey: .three_pointers_made)
		three_pointers_attempted = try values.decodeIfPresent(String.self, forKey: .three_pointers_attempted)
		three_pointers_percentage = try values.decodeIfPresent(String.self, forKey: .three_pointers_percentage)
		rebounds_offensive = try values.decodeIfPresent(String.self, forKey: .rebounds_offensive)
		rebounds_defensive = try values.decodeIfPresent(String.self, forKey: .rebounds_defensive)
		team_rebounds = try values.decodeIfPresent(String.self, forKey: .team_rebounds)
		assists = try values.decodeIfPresent(String.self, forKey: .assists)
		fouls = try values.decodeIfPresent(String.self, forKey: .fouls)
		team_fouls = try values.decodeIfPresent(String.self, forKey: .team_fouls)
		technical_fouls = try values.decodeIfPresent(String.self, forKey: .technical_fouls)
		steals = try values.decodeIfPresent(String.self, forKey: .steals)
		turnovers = try values.decodeIfPresent(String.self, forKey: .turnovers)
		team_turnovers = try values.decodeIfPresent(String.self, forKey: .team_turnovers)
		blocks = try values.decodeIfPresent(String.self, forKey: .blocks)
		short_timeout_remaining = try values.decodeIfPresent(String.self, forKey: .short_timeout_remaining)
		full_timeout_remaining = try values.decodeIfPresent(String.self, forKey: .full_timeout_remaining)
	}

}