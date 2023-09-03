//
//  ExtensionMainController.swift
//  PostsProject
//
//  Created by Олег Курбатов on 02.09.2023.
//

import UIKit

extension MainViewController {
        
    func registerCell() {
        mainUITableView.register(UINib(nibName: "\(SettingsPostsTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(SettingsPostsTableViewCell.self)")
    }
}
