//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Oleg Kanatov on 11.11.21.
//

import Foundation
import UIKit

class FeedViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        networkService.getFeed()
    }
}
