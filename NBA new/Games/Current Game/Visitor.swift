/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Visitor : Codable {
	let id : String?
	let team_team_key : String?
	let city : String?
	let abbreviation : String?
	let nickname : String?
	let url_name : String?
	let team_code : String?
	let score : String?
	let linescores : Linescores?
	let leaders : Leaders?
	let stats : Stats?
	let players : Players?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case team_team_key = "team_key"
		case city = "city"
		case abbreviation = "abbreviation"
		case nickname = "nickname"
		case url_name = "url_name"
		case team_code = "team_code"
		case score = "score"
		case linescores = "linescores"
		case leaders = "Leaders"
		case stats = "stats"
		case players = "players"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
        team_team_key = try values.decodeIfPresent(String.self, forKey: .team_team_key)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		abbreviation = try values.decodeIfPresent(String.self, forKey: .abbreviation)
		nickname = try values.decodeIfPresent(String.self, forKey: .nickname)
		url_name = try values.decodeIfPresent(String.self, forKey: .url_name)
		team_code = try values.decodeIfPresent(String.self, forKey: .team_code)
		score = try values.decodeIfPresent(String.self, forKey: .score)
		linescores = try values.decodeIfPresent(Linescores.self, forKey: .linescores)
        leaders = try values.decodeIfPresent(Leaders.self, forKey: .leaders)
		stats = try values.decodeIfPresent(Stats.self, forKey: .stats)
		players = try values.decodeIfPresent(Players.self, forKey: .players)
	}

}
