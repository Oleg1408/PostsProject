//
//  ViewController.swift
//  PostsProject
//
//  Created by Олег Курбатов on 31.08.2023.
//
import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    @IBOutlet weak var mainUITableView: UITableView!
    
    var postsArray: [Posts] = []
    var responseData = ResponseDataPost()
    
    var sortedData = [Posts]()
    var sortedLikes = [Posts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
        responseData.loadDataPost { value in
            self.postsArray = value
            DispatchQueue.main.async {
                self.sortedData = self.postsArray.sorted(by: { ($0.timeshamp ?? 0) > ($1.timeshamp ?? 0) })
                self.sortedLikes = self.postsArray.sorted(by: { ($0.likesCount ?? 0) > ($1.likesCount ?? 0) })
                self.mainUITableView.reloadData()
            }
        }
    }
    
    @IBAction func pressSortedButton(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: "Сортировка", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "По дате", style: .default, handler: { [weak self] (_) in
            guard let self = self else { return }
            self.postsArray = self.sortedData
            self.mainUITableView.reloadData()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "По рейтингу", style: .default, handler: { [weak self] (_) in
            guard let self = self else { return }
            self.postsArray = self.sortedLikes
            self.mainUITableView.reloadData()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        present(actionSheet, animated: true, completion: nil)
    }
}


// MARK: - Settings TableView

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsPostsTableViewCell", for: indexPath) as? SettingsPostsTableViewCell else { return UITableViewCell() }
        
        let valueArray = postsArray[indexPath.row]
        cell.configur(posts: valueArray)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let post = postsArray[indexPath.row]
        if let postID = post.postId {
            let postDetailsURLString = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/\(postID).json"
            
            if let postDetailsURL = URL(string: postDetailsURLString) {
                URLSession.shared.dataTask(with: postDetailsURL) { [weak self] (data, response, error) in
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let postDetails = try decoder.decode(PostDetails.self, from: data)
                            DispatchQueue.main.async {
                                if let detailsViewController = self?.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
                                    detailsViewController.postDetails = postDetails
                                    self?.navigationController?.pushViewController(detailsViewController, animated: true)
                                }
                            }
                        } catch {
                            print("Ошибка при декодировании данных о посте: \(error)")
                        }
                    } else if let error = error {
                        print("Ошибка при загрузке данных о посте: \(error.localizedDescription)")
                    }
                }.resume()
            } else {
                print("Некорректная URL-строка для данных о посте: \(postDetailsURLString)")
            }
        } else {
            print("ID поста отсутствует или не правильно передан.")
        }
        
    }
}

