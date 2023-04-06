//
//  BookReviewTests.swift
//  BookReviewTests
//
//  Created by 박준하 on 2023/01/30.
//

import XCTest
@testable import BookReview

final class ReviewListPresnterTests: XCTestCase {
    var sut: ReviewListPresenter!
    var viewController: ReviewListProtocol!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockReviewListViewController()
        sut = ReviewListPresenter(viewController: viewController)
        
//        viewController = MockReviewListViewController()
//        sut = ReviewListPresenter(viewController: viewController)
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        
        super.tearDown()
    }
}

final class MockReviewListViewController: ReviewListProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupViews = false
    var isCalledPresentToReviewWriteViewController = false
    var isCalledReloadTableView = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func presentToReviewWriteViewController() {
        isCalledPresentToReviewWriteViewController = true
    }
    
    func reloadTableView() {
        isCalledReloadTableView = true
    }
    
    
}
