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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigatorCV()
        registerCell()
        
        responseData.loadDataPost { value in
            self.postsArray = value
            self.mainUITableView.reloadData()
        }
    }
    
    private func navigatorCV() {
        navigationController?.navigationBar.isHidden = false
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
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        if  let detailsController = main.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            navigationController?.pushViewController(detailsController, animated: true)
        }
    }
}
