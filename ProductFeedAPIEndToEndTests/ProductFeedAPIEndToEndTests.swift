//
//  ProductFeedAPIEndToEndTests.swift
//  ProductFeedAPIEndToEndTests
//
//  Created by Amin faruq on 19/04/24.
//

import XCTest
import ProductFeed

final class ProductFeedAPIEndToEndTests: XCTestCase {
    
    func test_endToEndTestServerGETFeedResult_matchesFixedTestAccountData() {
        switch getProductResult() {
        case let .success(items)?:
            XCTAssertEqual(items.count, 2, "Expected 2 items in the test dummy json")
            
            XCTAssertEqual(items[0], expectedItem1(), "Unexpected item values at index 0")
            XCTAssertEqual(items[1], expectedItem2(), "Unexpected item values at index 1")
            
        case let .failure(error)?:
            XCTFail("Expected successful feed result, got \(error) instead")
            
        default:
            XCTFail("Expected successful feed result, got no result instead")
        }
    }
    
    // MARK: - Helpers
    
    private func getProductResult(file: StaticString = #filePath, line: UInt = #line) -> LoadFeedResult? {
        let testServerURL = URL(string: "https://dummyjson.com/products/search?skip=0&limit=2&q=")!
        let client = URLSessionHTTPClient()
        let loader = RemoteFeedLoader(url: testServerURL, client: client)
        
        let exp = expectation(description: "Wait for load completion")
        
        trackForMemoryLeaks(client, file: file, line: line)
        trackForMemoryLeaks(loader, file: file, line: line)
        
        var receivedResult: LoadFeedResult?
        loader.load { result in
            receivedResult = result
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10.0)
        
        return receivedResult
    }
    
    private func expectedItem1() -> ProductItem {
        return ProductItem(
            id: 1,
            title: "iPhone 9",
            description: "An apple mobile which is nothing like apple",
            price: 549,
            discountPercentage: 12.96,
            rating: 4.69,
            stock: 94,
            brand: "Apple",
            category: "smartphones",
            thumbnail: URL(string: "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg")!,
            images: [
                URL(string: "https://cdn.dummyjson.com/product-images/1/1.jpg")!,
                URL(string: "https://cdn.dummyjson.com/product-images/1/2.jpg")!,
                URL(string: "https://cdn.dummyjson.com/product-images/1/3.jpg")!,
                URL(string: "https://cdn.dummyjson.com/product-images/1/4.jpg")!,
                URL(string: "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg")!
            ]
        )
    }
    
    private func expectedItem2() -> ProductItem {
        return ProductItem(
            id: 2,
            title: "iPhone X",
            description: "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...",
            price: 899,
            discountPercentage: 17.94,
            rating: 4.44,
            stock: 34,
            brand: "Apple",
            category: "smartphones",
            thumbnail: URL(string: "https://cdn.dummyjson.com/product-images/2/thumbnail.jpg")!,
            images: [
                URL(string: "https://cdn.dummyjson.com/product-images/2/1.jpg")!,
                URL(string: "https://cdn.dummyjson.com/product-images/2/2.jpg")!,
                URL(string: "https://cdn.dummyjson.com/product-images/2/3.jpg")!,
                URL(string: "https://cdn.dummyjson.com/product-images/2/thumbnail.jpg")!
            ]
        )
    }
}
