//
//  ResponseDataDetails.swift
//  PostsProject
//
//  Created by Олег Курбатов on 08.11.2023.
//

import Foundation
import Alamofire

class LoadPost {
    func loadPostDetails(postID: Int, completion: @escaping (PostDetails?) -> Void) {
        let postDetailsURLString = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/\(postID).json"

        guard let postDetailsURL = URL(string: postDetailsURLString) else {
            print("Wrong URL: \(postDetailsURLString)")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: postDetailsURL) { (data, response, error) in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Server error or invalid response")
                completion(nil)
                return
            }

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let postDetails = try decoder.decode(PostDetails.self, from: data)
                    completion(postDetails)
                } catch {
                    print("Error decoding post: \(error)")
                    completion(nil)
                }
            } else {
                print("No data received")
                completion(nil)
            }
        }.resume()
    }
}
