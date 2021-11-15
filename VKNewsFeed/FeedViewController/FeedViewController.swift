//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Oleg Kanatov on 11.11.21.
//

import Foundation
import UIKit

class FeedViewController: UIViewController {
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        fetcher.getFeed { feedResponse in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map({ feedItem in
                print(feedItem.date)
            })
        }
    }
}
