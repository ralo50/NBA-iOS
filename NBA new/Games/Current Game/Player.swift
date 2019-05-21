/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Player : Codable {
	let first_name : String?
	let last_name : String?
	let jersey_number : String?
	let person_id : String?
	let position_short : String?
	let position_full : String?
	let minutes : String?
	let seconds : String?
	let points : String?
	let field_goals_made : String?
	let field_goals_attempted : String?
	let player_code : String?
	let free_throws_made : String?
	let free_throws_attempted : String?
	let three_pointers_made : String?
	let three_pointers_attempted : String?
	let rebounds_offensive : String?
	let rebounds_defensive : String?
	let assists : String?
	let fouls : String?
	let steals : String?
	let turnovers : String?
	let team_turnovers : String?
	let blocks : String?
	let plus_minus : String?
	let on_court : String?
	let starting_position : String?

	enum CodingKeys: String, CodingKey {

		case first_name = "first_name"
		case last_name = "last_name"
		case jersey_number = "jersey_number"
		case person_id = "person_id"
		case position_short = "position_short"
		case position_full = "position_full"
		case minutes = "minutes"
		case seconds = "seconds"
		case points = "points"
		case field_goals_made = "field_goals_made"
		case field_goals_attempted = "field_goals_attempted"
		case player_code = "player_code"
		case free_throws_made = "free_throws_made"
		case free_throws_attempted = "free_throws_attempted"
		case three_pointers_made = "three_pointers_made"
		case three_pointers_attempted = "three_pointers_attempted"
		case rebounds_offensive = "rebounds_offensive"
		case rebounds_defensive = "rebounds_defensive"
		case assists = "assists"
		case fouls = "fouls"
		case steals = "steals"
		case turnovers = "turnovers"
		case team_turnovers = "team_turnovers"
		case blocks = "blocks"
		case plus_minus = "plus_minus"
		case on_court = "on_court"
		case starting_position = "starting_position"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
		last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
		jersey_number = try values.decodeIfPresent(String.self, forKey: .jersey_number)
		person_id = try values.decodeIfPresent(String.self, forKey: .person_id)
		position_short = try values.decodeIfPresent(String.self, forKey: .position_short)
		position_full = try values.decodeIfPresent(String.self, forKey: .position_full)
		minutes = try values.decodeIfPresent(String.self, forKey: .minutes)
		seconds = try values.decodeIfPresent(String.self, forKey: .seconds)
		points = try values.decodeIfPresent(String.self, forKey: .points)
		field_goals_made = try values.decodeIfPresent(String.self, forKey: .field_goals_made)
		field_goals_attempted = try values.decodeIfPresent(String.self, forKey: .field_goals_attempted)
		player_code = try values.decodeIfPresent(String.self, forKey: .player_code)
		free_throws_made = try values.decodeIfPresent(String.self, forKey: .free_throws_made)
		free_throws_attempted = try values.decodeIfPresent(String.self, forKey: .free_throws_attempted)
		three_pointers_made = try values.decodeIfPresent(String.self, forKey: .three_pointers_made)
		three_pointers_attempted = try values.decodeIfPresent(String.self, forKey: .three_pointers_attempted)
		rebounds_offensive = try values.decodeIfPresent(String.self, forKey: .rebounds_offensive)
		rebounds_defensive = try values.decodeIfPresent(String.self, forKey: .rebounds_defensive)
		assists = try values.decodeIfPresent(String.self, forKey: .assists)
		fouls = try values.decodeIfPresent(String.self, forKey: .fouls)
		steals = try values.decodeIfPresent(String.self, forKey: .steals)
		turnovers = try values.decodeIfPresent(String.self, forKey: .turnovers)
		team_turnovers = try values.decodeIfPresent(String.self, forKey: .team_turnovers)
		blocks = try values.decodeIfPresent(String.self, forKey: .blocks)
		plus_minus = try values.decodeIfPresent(String.self, forKey: .plus_minus)
		on_court = try values.decodeIfPresent(String.self, forKey: .on_court)
		starting_position = try values.decodeIfPresent(String.self, forKey: .starting_position)
	}

}