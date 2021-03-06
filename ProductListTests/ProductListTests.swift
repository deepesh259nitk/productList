//
//  ProductListTests.swift
//  ProductListTests
//
//  Created by ITRMG on 2017-24-07.
//  Copyright © 2016 Vasthimal, Deepesh : @djrecker. All rights reserved.
//

import XCTest
@testable import SHOPME

class ProductListTests: XCTestCase {
    var productList = [Product]()
    override func setUp() {
        super.setUp()
        AppConstants.isSTUBBED = true //Load Stubbed JSON data for unit test.
        ProductDetailsDataManager.sharedObject.populateData()
    }
    func testProductListLoaded() {
        let api = ProductService()
        ProductService.json = nil
        api.loadProducts(nil)
        XCTAssertNil(ProductService.json, "ProductService.json is not nil")
    }
    //below is required for testing different data.
    //swiftlint:disable function_body_length
    func testParseData() {
        if let cachedData = ProductDetailsDataManager.sharedObject.cachedData() {
            self.productList = cachedData
        }
        XCTAssertNotNil(ProductDetailsDataManager.sharedObject.cachedData(), "Cached Data is nil")
        XCTAssertEqual(self.productList.count, 60, "productList Count does not match")
        for (productIndex, aProduct) in self.productList.enumerated() {
            switch productIndex {
            case 0:
                XCTAssertEqual(aProduct.productName, "Le Original Mix boyfriend jeans ", "Product Name does not match")
                XCTAssertEqual(aProduct.price, 49000, "Product Price does not match")
                XCTAssertEqual(aProduct.imageURL,
                               "https://cache.net-a-porter.com/images/products/802851/802851_fr_sl.jpg",
                               "Product Image URL does not match")
                XCTAssertEqual(aProduct.productId, 802851, "Product productId does not match")
            case 1:
                XCTAssertEqual(aProduct.productName, "Mini Mix denim skirt", "Product Name does not match")
                XCTAssertEqual(aProduct.price, 29500, "Product Price does not match")
                XCTAssertEqual(aProduct.imageURL,
                               "https://cache.net-a-porter.com/images/products/802856/802856_fr_sl.jpg",
                               "Product Image URL does not match")
                XCTAssertEqual(aProduct.productId, 802856, "Product productId does not match")
            case 2:
                XCTAssertEqual(aProduct.productName, "High Mix straight-leg jeans", "Product Name does not match")
                XCTAssertEqual(aProduct.price, 34500, "Product Price does not match")
                XCTAssertEqual(aProduct.imageURL,
                               "https://cache.net-a-porter.com/images/products/802852/802852_fr_sl.jpg",
                               "Product Image URL does not match")
                XCTAssertEqual(aProduct.productId, 802852, "Product productId does not match")
            case 3:
                XCTAssertEqual(aProduct.productName, "Fluted stretch-crepe midi dress", "Product Name does not match")
                XCTAssertEqual(aProduct.price, 31000, "Product Price does not match")
                XCTAssertEqual(aProduct.imageURL,
                               "https://cache.net-a-porter.com/images/products/752202/752202_fr_sl.jpg",
                               "Product Image URL does not match")
                XCTAssertEqual(aProduct.productId, 752202, "Product productId does not match")
            case 4:
                XCTAssertEqual(aProduct.productName, "Asymmetric cashmere poncho", "Product Name does not match")
                XCTAssertEqual(aProduct.price, 79500, "Product Price does not match")
                XCTAssertEqual(aProduct.imageURL,
                               "https://cache.net-a-porter.com/images/products/716656/716656_fr_sl.jpg",
                               "Product Image URL does not match")
                XCTAssertEqual(aProduct.productId, 716656, "Product productId does not match")
            default:
                print("do nothing")
            }
        }
    }
    func testCurrencyFormatter() {
        let price1: Int64 = 24500
        let price2: Int64 = 45000
        let price3: Int64 = 345343
        XCTAssertEqual("245.00", PriceUtilities.pounds(forPennies: price1))
        XCTAssertEqual("450.00", PriceUtilities.pounds(forPennies: price2))
        XCTAssertEqual("3453.43", PriceUtilities.pounds(forPennies: price3))
        XCTAssertEqual("£ 245.00", PriceUtilities.formatWithPoundSign(PriceUtilities.pounds(forPennies: price1)!))
        XCTAssertEqual("£ 450.00", PriceUtilities.formatWithPoundSign(PriceUtilities.pounds(forPennies: price2)!))
        XCTAssertEqual("£ 3453.43", PriceUtilities.formatWithPoundSign(PriceUtilities.pounds(forPennies: price3)!))
    }
    func testfindJSON() {
        XCTAssertNotNil(PathUtilities.findJSON("categories"))
    }
}
