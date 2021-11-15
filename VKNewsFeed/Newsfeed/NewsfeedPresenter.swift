//
//  NewsfeedPresenter.swift
//  VKNewsFeed
//
//  Created by Oleg Kanatov on 15.11.21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedPresentationLogic {
    func presentData(response: Newsfeed.Model.Response.ResponseType)
}

class NewsfeedPresenter: NewsfeedPresentationLogic {
    weak var viewController: NewsfeedDisplayLogic?
    
    func presentData(response: Newsfeed.Model.Response.ResponseType) {
        
        switch response {
        case .some:
            print(".some Presenter")
            viewController?.displayData(viewModel: .displayNewsfeed)
        case .presentNewsfeed:
            print(".presentNewsfeed Presenter")
            viewController?.displayData(viewModel: .displayNewsfeed)
        }
    }
    
}
