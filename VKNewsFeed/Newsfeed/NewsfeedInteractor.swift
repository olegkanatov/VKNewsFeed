//
//  NewsfeedInteractor.swift
//  VKNewsFeed
//
//  Created by Oleg Kanatov on 15.11.21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsfeedBusinessLogic {
    func makeRequest(request: Newsfeed.Model.Request.RequestType)
}

class NewsfeedInteractor: NewsfeedBusinessLogic {
    
    var presenter: NewsfeedPresentationLogic?
    var service: NewsfeedService?
    
    func makeRequest(request: Newsfeed.Model.Request.RequestType) {
        
        if service == nil {
            service = NewsfeedService()
        }
        
        switch request {
        case .getNewsfeed:
            service?.getFeed(completion: { [weak self] revealedPostIds, feed in
                self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feed, revealedPostIds: revealedPostIds))
            })
        case .getUser:
            service?.getUser(completion: { [weak self] user in
                self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentUserInfo(user: user))
            })
        case .revealPostIds(let postId):
            service?.revealPostIds(forPostId: postId, completion: { [weak self] revealedPostIds, feed in
                self?.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feed, revealedPostIds: revealedPostIds))
            })
        case .getNextBatch:
            self.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentFooterLoader)
            service?.getNextBatch(completion: { revealedPostIds, feed in
                self.presenter?.presentData(response: Newsfeed.Model.Response.ResponseType.presentNewsfeed(feed: feed, revealedPostIds: revealedPostIds))
            })
        }
    }
}
