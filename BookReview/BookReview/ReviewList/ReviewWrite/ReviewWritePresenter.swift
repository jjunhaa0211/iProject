//
//  ReviewWritePresenter.swift
//  BookReview
//
//  Created by 박준하 on 2023/01/31.
//

import UIKit

protocol ReviewWriteProtocol {
    func setupNavigationBar()
    func showCloseAlertController()
    func close()
    func setupViews()
    func presentToSearchBookViewController()
    func updateViews(title: String, imageURL: URL?)
}

final class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol
    
    private let userDefaultsManager = UserDefaultsManager()
    
    private var book: Book?
    
    let contentsTextViewPlaceHolderText = "내용을 입력해주세요. "
    
    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func didTapLeftBarButton() {
        viewController.showCloseAlertController()
    }
    
    func didTapRightBarButton(contentsText: String) {
        
        guard let book = book,
              contentsText != contentsTextViewPlaceHolderText
        else { return }
        
        let bookReview = BookReview(
            title: book.title,
            contents: contentsText,
            imageURL: book.imageURL
        )
        
        userDefaultsManager.setReview(bookReview)
        
        viewController.close()
    }
    
    func didTapBookTitleButton() {
        viewController.presentToSearchBookViewController()
    }
}

extension ReviewWritePresenter: SearchBookDelegate {
    func selectBook(_ book: Book) {
        self.book = book
        print("😏 \(book.title)")
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
    }
}
