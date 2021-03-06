//
//  WebImageView.swift
//  VKNewsFeed
//
//  Created by Oleg Kanatov on 16.11.21.
//

import Foundation
import UIKit

class WebImageView: UIImageView {
    
    private var currentUrlString: String?
    
    func set(imageURL: String?) {
        
        currentUrlString = imageURL
        
        guard let imageURL = imageURL, let url = URL(string: imageURL) else {
            self.image = nil
            return }
        
        if let cashedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            
            self.image = UIImage(data: cashedResponse.data)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.image = UIImage(data: data)
                    self?.handleLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    
    private func handleLoadedImage(data: Data, response: URLResponse) {
        
        guard let responseURL = response.url else { return }
        
        let cachedResponse = CachedURLResponse(response: response, data: data)
        
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
        
        if responseURL.absoluteString == currentUrlString {
            self.image = UIImage(data: data)
        }
    }
}
