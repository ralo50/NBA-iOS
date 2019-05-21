/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct CurrentGame: Codable {
	let id : String?
	let game_url : String?
	let season_id : String?
	let date : String?
	let time : String?
	let arena : String?
	let city : String?
	let state : String?
	let country : String?
	let home_start_date : String?
	let home_start_time : String?
	let visitor_start_date : String?
	let visitor_start_time : String?
	let previewAvailable : String?
	let recapAvailable : String?
	let notebookAvailable : String?
	let tnt_ot : String?
	let attendance : String?
	let officials : [Officials]?
	let period_time : Period_time?
	let visitor : Visitor?
	let home : Home?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case game_url = "game_url"
		case season_id = "season_id"
		case date = "date"
		case time = "time"
		case arena = "arena"
		case city = "city"
		case state = "state"
		case country = "country"
		case home_start_date = "home_start_date"
		case home_start_time = "home_start_time"
		case visitor_start_date = "visitor_start_date"
		case visitor_start_time = "visitor_start_time"
		case previewAvailable = "previewAvailable"
		case recapAvailable = "recapAvailable"
		case notebookAvailable = "notebookAvailable"
		case tnt_ot = "tnt_ot"
		case attendance = "attendance"
		case officials = "officials"
		case period_time = "period_time"
		case visitor = "visitor"
		case home = "home"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		game_url = try values.decodeIfPresent(String.self, forKey: .game_url)
		season_id = try values.decodeIfPresent(String.self, forKey: .season_id)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		time = try values.decodeIfPresent(String.self, forKey: .time)
		arena = try values.decodeIfPresent(String.self, forKey: .arena)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		home_start_date = try values.decodeIfPresent(String.self, forKey: .home_start_date)
		home_start_time = try values.decodeIfPresent(String.self, forKey: .home_start_time)
		visitor_start_date = try values.decodeIfPresent(String.self, forKey: .visitor_start_date)
		visitor_start_time = try values.decodeIfPresent(String.self, forKey: .visitor_start_time)
		previewAvailable = try values.decodeIfPresent(String.self, forKey: .previewAvailable)
		recapAvailable = try values.decodeIfPresent(String.self, forKey: .recapAvailable)
		notebookAvailable = try values.decodeIfPresent(String.self, forKey: .notebookAvailable)
		tnt_ot = try values.decodeIfPresent(String.self, forKey: .tnt_ot)
		attendance = try values.decodeIfPresent(String.self, forKey: .attendance)
		officials = try values.decodeIfPresent([Officials].self, forKey: .officials)
		period_time = try values.decodeIfPresent(Period_time.self, forKey: .period_time)
		visitor = try values.decodeIfPresent(Visitor.self, forKey: .visitor)
		home = try values.decodeIfPresent(Home.self, forKey: .home)
	}

}
