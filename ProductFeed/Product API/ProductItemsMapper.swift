//
//  ProductItemsMapper.swift
//  ProductFeed
//
//  Created by Amin faruq on 18/04/24.
//

import Foundation

internal final class ProductItemsMapper {
    
    private struct Root: Decodable {
        let products: [Item]
        let total: Int
        let skip: Int
        let limit: Int
        
        var product: [ProductItem] {
            return products.map({ $0.item })
        }
    }
    
    private struct Item: Decodable {
        public let id: Int
        public let title, description: String
        public let price: Int
        public let discountPercentage, rating: Double
        public let stock: Int
        public let brand, category: String
        public let thumbnail: URL
        public let images: [URL]
        
        var item: ProductItem {
            return ProductItem(
                id: id,
                title: title,
                description: description,
                price: price,
                discountPercentage: discountPercentage,
                rating: rating,
                stock: stock,
                brand: brand,
                category: category,
                thumbnail: thumbnail,
                images: images)
        }
    }
    
    static var OK_200: Int { return 200 }

    internal static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [ProductItem] {
        guard response.statusCode == OK_200 else {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        let root = try JSONDecoder().decode(Root.self, from: data)
        return root.products.map({ $0.item })
    }
    
    internal static func map(_ data: Data, from response: HTTPURLResponse) -> RemoteFeedLoader.Result {
        guard response.statusCode == OK_200, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            return .failure(RemoteFeedLoader.Error.invalidData)
        }
        
        return .success(root.product)
    }

}
