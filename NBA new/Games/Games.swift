/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Games : Codable {
	let seasonYear : String?
	let gameId : String?
	let arena : Arena?
	let isGameActivated : Bool?
	let statusNum : Int?
	let extendedStatusNum : Int?
	let startTimeEastern : String?
	let startTimeUTC : String?
	let endTimeUTC : String?
	let startDateEastern : String?
	let clock : String?
	let isBuzzerBeater : Bool?
	let isPreviewArticleAvail : Bool?
	let isRecapArticleAvail : Bool?
	let hasGameBookPdf : Bool?
	let isStartTimeTBD : Bool?
	let nugget : Nugget?
	let attendance : String?
	let gameDuration : GameDuration?
	let period : Period?
	let vTeam : VTeam?
	let hTeam : HTeam?

	enum CodingKeys: String, CodingKey {

		case seasonYear = "seasonYear"
		case gameId = "gameId"
		case arena = "arena"
		case isGameActivated = "isGameActivated"
		case statusNum = "statusNum"
		case extendedStatusNum = "extendedStatusNum"
		case startTimeEastern = "startTimeEastern"
		case startTimeUTC = "startTimeUTC"
		case endTimeUTC = "endTimeUTC"
		case startDateEastern = "startDateEastern"
		case clock = "clock"
		case isBuzzerBeater = "isBuzzerBeater"
		case isPreviewArticleAvail = "isPreviewArticleAvail"
		case isRecapArticleAvail = "isRecapArticleAvail"
		case hasGameBookPdf = "hasGameBookPdf"
		case isStartTimeTBD = "isStartTimeTBD"
		case nugget = "nugget"
		case attendance = "attendance"
		case gameDuration = "gameDuration"
		case period = "period"
		case vTeam = "vTeam"
		case hTeam = "hTeam"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		seasonYear = try values.decodeIfPresent(String.self, forKey: .seasonYear)
		gameId = try values.decodeIfPresent(String.self, forKey: .gameId)
		arena = try values.decodeIfPresent(Arena.self, forKey: .arena)
		isGameActivated = try values.decodeIfPresent(Bool.self, forKey: .isGameActivated)
		statusNum = try values.decodeIfPresent(Int.self, forKey: .statusNum)
		extendedStatusNum = try values.decodeIfPresent(Int.self, forKey: .extendedStatusNum)
		startTimeEastern = try values.decodeIfPresent(String.self, forKey: .startTimeEastern)
		startTimeUTC = try values.decodeIfPresent(String.self, forKey: .startTimeUTC)
		endTimeUTC = try values.decodeIfPresent(String.self, forKey: .endTimeUTC)
		startDateEastern = try values.decodeIfPresent(String.self, forKey: .startDateEastern)
		clock = try values.decodeIfPresent(String.self, forKey: .clock)
		isBuzzerBeater = try values.decodeIfPresent(Bool.self, forKey: .isBuzzerBeater)
		isPreviewArticleAvail = try values.decodeIfPresent(Bool.self, forKey: .isPreviewArticleAvail)
		isRecapArticleAvail = try values.decodeIfPresent(Bool.self, forKey: .isRecapArticleAvail)
		hasGameBookPdf = try values.decodeIfPresent(Bool.self, forKey: .hasGameBookPdf)
		isStartTimeTBD = try values.decodeIfPresent(Bool.self, forKey: .isStartTimeTBD)
		nugget = try values.decodeIfPresent(Nugget.self, forKey: .nugget)
		attendance = try values.decodeIfPresent(String.self, forKey: .attendance)
		gameDuration = try values.decodeIfPresent(GameDuration.self, forKey: .gameDuration)
		period = try values.decodeIfPresent(Period.self, forKey: .period)
		vTeam = try values.decodeIfPresent(VTeam.self, forKey: .vTeam)
		hTeam = try values.decodeIfPresent(HTeam.self, forKey: .hTeam)
	}

}