//
//  GalleryCollectionViewCell.swift
//  VKNewsFeed
//
//  Created by Oleg Kanatov on 18.11.21.
//

import Foundation
import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "GalleryCollectionViewCell"
    
    let myImageView: WebImageView = {
        
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(myImageView)
        
        backgroundColor = .cyan
        
        myImageView.fillSuperview()
    }
    
    override func prepareForReuse() {
        
        myImageView.image = nil
    }
    
    func set(imageUrl: String?) {
        
        myImageView.set(imageURL: imageUrl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
