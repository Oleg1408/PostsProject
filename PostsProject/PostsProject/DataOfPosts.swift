import Foundation

struct DataOfPosts : Codable {
	let posts : [Posts]?

	enum CodingKeys: String, CodingKey {

		case posts = "posts"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		posts = try values.decodeIfPresent([Posts].self, forKey: .posts)
	}
}
