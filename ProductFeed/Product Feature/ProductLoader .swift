//
//  ProductLoader .swift
//  ProductFeed
//
//  Created by Amin faruq on 16/04/24.
//

import Foundation

public enum LoadFeedResult {
    case success([ProductItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
