//
//  ModelsOfDetailsController.swift
//  PostsProject
//
//  Created by Олег Курбатов on 05.09.2023.
//

import UIKit

struct PostDetails: Codable {
    let post: PostInfo?
    
    struct PostInfo: Codable {
        let postId: Int?
        let timeshamp: Int?
        let title: String?
        let text: String?
        let postImage: String?
        let likesCount: Int?
        
        enum CodingKeys: String, CodingKey {
            case postId
            case timeshamp
            case title
            case text
            case postImage
            case likesCount = "likes_count"
        }
    }
}
