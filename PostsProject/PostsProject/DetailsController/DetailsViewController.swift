//
//  DetailsViewController.swift
//  PostsProject
//
//  Created by Олег Курбатов on 01.09.2023.
//

import UIKit

class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigatorCV()
    }
    
    
    private func navigatorCV() {
        navigationController?.navigationBar.isHidden = true
    }
    


}
