//
//  ProductItem.swift
//  ProductFeed
//
//  Created by Amin faruq on 16/04/24.
//

import Foundation

public struct ProductItem: Equatable {
    public let id: Int
    public let title, description: String
    public let price: Int
    public let discountPercentage, rating: Double
    public let stock: Int
    public let brand, category: String
    public let thumbnail: URL
    public let images: [URL]
    
    public init(
        id: Int,
        title: String,
        description: String,
        price: Int,
        discountPercentage: Double,
        rating: Double,
        stock: Int,
        brand: String,
        category: String,
        thumbnail: URL,
        images: [URL]) {
            
        self.id = id
        self.title = title
        self.description = description
        self.price = price
        self.discountPercentage = discountPercentage
        self.rating = rating
        self.stock = stock
        self.brand = brand
        self.category = category
        self.thumbnail = thumbnail
        self.images = images
    }
}

