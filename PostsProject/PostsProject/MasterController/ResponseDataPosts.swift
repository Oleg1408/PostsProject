//
//  ResponceDataPosts.swift
//  PostsProject
//
//  Created by Олег Курбатов on 03.09.2023.
//
import Foundation
import Alamofire

class ResponseDataPost {
    
    func loadDataPost(completion: @escaping([Posts])->(), failure: @escaping(Error)->()) {
        
        let urlPosts = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json"
        
        AF.request(urlPosts, method: .get, parameters: nil).response { response in
            switch response.result {
            case .success(let reciveDataPosts):
                guard let responceDataPosts = reciveDataPosts else {
                let error = NSError(domain: "YourDomain", code: 404, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                    failure(error)
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let dataPosts = try decoder.decode(DataOfPosts.self, from: responceDataPosts)
                    completion(dataPosts.posts ?? [])
                } catch {
                    failure(error)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
}
