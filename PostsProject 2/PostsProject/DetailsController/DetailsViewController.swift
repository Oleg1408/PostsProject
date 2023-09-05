//
//  DetailsViewController.swift
//  PostsProject
//
//  Created by Олег Курбатов on 01.09.2023.
//

import UIKit
import Alamofire

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
            timePost.text = "\(postDetails.timeshamp ?? 0)"
            countOfLikes.text = "\(postDetails.likesCount ?? 0)"
            imageHeart.image = UIImage(named: "heart")
        } else {
            print("No Data")
        }
    }
}
