
var newPostsArray: Posts?
//
//// var postDetails: PostDetails?
//
//
//
//
//override func viewDidLoad() {
//    super.viewDidLoad()
//
//    //        loadPostDetails()
//    //            updateUI()
//    //
//
////        func loadPostDetails(postId: Int, completion: @escaping (PostDetails?) -> Void) {
////            let url = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/\(postId).json"
////            print(url)
////
////            AF.request(url, method: .get, parameters: nil).responseDecodable(of: PostDetails.self) { response in
////                if let postDetails = response.value {
////                    completion(postDetails)
////                } else {
////                    completion(nil)
////                }
////            }
////        }
//
//
//    if let postId = newPostsArray?.postId {
//        responseData?.loadDataPost(completion: { [weak self] postDetails in
//            guard let self = self else { return }
//
//
//            if let postDetails = newPostsArray {
//                self.titleText.text = postDetails.title
//                self.detailsText.text = postDetails.previewText
//                self.countOfLikes.text = "\(postDetails.likesCount ?? 0)"
//                self.timePost.text = "\(postDetails.timeshamp ?? 0)"
//                self.imageHeart.image = UIImage(named: "heart")
//
//            }
//        })
//
//
//

//
//}
//}
