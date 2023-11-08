//
//  DetailsViewController.swift
//  PostsProject
//
//  Created by Олег Курбатов on 01.09.2023.
//

import UIKit
import Alamofire
import SDWebImage

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var centralImageView: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var detailsText: UILabel!
    @IBOutlet weak var countOfLikes: UILabel!
    @IBOutlet weak var imageHeart: UIImageView!
    @IBOutlet weak var timePost: UILabel!
    
    var postDetails: PostDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
    }
        
    private func config() {
        if let postDetails = postDetails?.post {
            titleText.text = postDetails.title ?? ""
            detailsText.text = postDetails.text ?? ""
            countOfLikes.text = "\(postDetails.likesCount ?? 0)"
            imageHeart.image = UIImage(named: "heart")
            settingsData()
            guard let postImageURL = postDetails.postImage else { return }
            loadPoster(urlString: postImageURL)
        } else {
            print("No Data")
        }
    }
    
    private func settingsData() {
        guard let data = postDetails?.post else {return}
        guard let timestamp = data.timeshamp else {return}
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: date)
        self.timePost.text = dateString
    }
    
    private func loadPoster(urlString: String) {
        guard let imageUrl = URL(string: urlString) else { return }
        self.centralImageView.sd_setImage(with: imageUrl)
    }
}
