//
//  SettingsPostsTableViewCell.swift
//  PostsProject
//
//  Created by Олег Курбатов on 02.09.2023.
//

import UIKit

class SettingsPostsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var mainTextLable: UILabel!
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var countLikesLable: UILabel!
    @IBOutlet weak var timePostLable: UILabel!
    @IBOutlet weak var pressTextButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonSettings()
    }
    
    private func buttonSettings() {
        pressTextButton.setTitle("Развернуть", for: .normal)
    }
    
    func configur(posts: Posts) {
        self.titleLable.text = posts.title
        self.mainTextLable.text = posts.previewText
        self.countLikesLable.text = "\(posts.likesCount ?? 0)"
        self.timePostLable.text = "\(posts.timeshamp ?? 0)"
        self.heartImageView.image = UIImage(named: "heart")
    }
    
    @IBAction func testButton(_ sender: Any) {
        
        if mainTextLable.numberOfLines == 2 {
            pressTextButton.setTitle("Свернуть", for: .normal)
            mainTextLable.numberOfLines = 0
        } else {
            pressTextButton.setTitle("Развернуть", for: .normal)
            mainTextLable.numberOfLines = 2
        }
        mainTextLable.sizeToFit()
        
        if let tableView = superview as? UITableView {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
}
