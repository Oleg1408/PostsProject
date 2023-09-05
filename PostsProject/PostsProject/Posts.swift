import Foundation

struct Posts: Codable {
    let postId: Int?
    let timeshamp: Date?
    let title: String?
    let previewText: String?
    let likesCount: Int?

    enum CodingKeys: String, CodingKey {
        case postId = "postId"
        case timeshamp = "timeshamp"
        case title = "title"
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        postId = try values.decodeIfPresent(Int.self, forKey: .postId)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        previewText = try values.decodeIfPresent(String.self, forKey: .previewText)
        likesCount = try values.decodeIfPresent(Int.self, forKey: .likesCount)

        if let timestamp = try values.decodeIfPresent(Int.self, forKey: .timeshamp) {
            timeshamp = Date(timeIntervalSince1970: TimeInterval(timestamp))
        } else {
            timeshamp = nil
        }
    }
}

