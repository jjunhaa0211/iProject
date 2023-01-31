//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by 박준하 on 2023/01/31.
//

import UIKit

protocol ReviewWriteProtocol {
    func setupNavigationBar()
}

final class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol
    
    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
    }
}
