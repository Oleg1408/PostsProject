//
//  ResponceDataPosts.swift
//  PostsProject
//
//  Created by Олег Курбатов on 03.09.2023.
//
import Foundation
import Alamofire

class ResponseDataPost {
    
    func loadDataPost(completion: @escaping([Posts])->()) {
        
        let urlPosts = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json"
        
        AF.request(urlPosts, method: .get, parameters: nil).responseDecodable(of: DataOfPosts.self) { reciveDataPosts in
            let decoder = JSONDecoder()
            if let responceDataPosts = reciveDataPosts.data {
                if let dataPosts = try? decoder.decode(DataOfPosts.self, from: responceDataPosts) {
                    completion(dataPosts.posts ?? [])
                }
            }
        }
    }
}
