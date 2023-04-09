//
//  ReviewListPresenter.swift
//  BookReview
//
//  Created by 박준하 on 2023/01/30.
//

import UIKit
import Kingfisher

protocol ReviewListProtocol{
    func setupNavigationBar()
    func setupViews()
    func presentToReviewWriteViewController()
    func reloadTableView()
}

final class ReviewListPresenter: NSObject {
    private let viewController: ReviewListProtocol
    private let userDefaultManger = UserDefaultsManager()
    
    private var review: [BookReView] = []
    
    init(viewController:
         ReviewListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setupNavigationBar()
        viewController.setupViews()
    }
    
    func viewWillAppear() {
        review = userDefaultManger.getReviews()
        viewController.reloadTableView()
    }
    
    func didTapRightBarButtonItem() {
        viewController.presentToReviewWriteViewController()
    }
}

extension ReviewListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return review.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let review = review[indexPath.row]
        cell.textLabel?.text = review.title
        cell.detailTextLabel?.text = review.contents
        cell.imageView?.kf.setImage(with: review.imageURL, placeholder: .none) { _ in
            cell.setNeedsLayout()
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
}
