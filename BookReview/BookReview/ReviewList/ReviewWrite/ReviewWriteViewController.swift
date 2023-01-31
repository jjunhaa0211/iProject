//
//  ReviewWriteViewController.swift
//  BookReview
//
//  Created by 박준하 on 2023/01/31.
//

import SnapKit
import UIKit

final class ReviewWriteViewController: UIViewController {
    private lazy var presenter = ReviewWritePresenter(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension ReviewWriteViewController: ReviewWriteProtocol {
    func setupNavigationBar() {
        navigationItem.leftBarButtonItem =
        UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: nil
        )
        navigationItem.rightBarButtonItem =
        UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: nil
        )
    }
    
    func showCloseAlertSheet() {
        let alertController = UIAlertController(title: "작성중인 내용이 있습니다. 정말 닫으시겠습니까?", message: nil, preferredStyle: .alert)
        
        //클로저 안에서 weak self를 쓰는 이유는 혹시나 발생할 수 있는 메모리 릭을 방지할 수 있는 수단이 될 수 있으니까 가능하면 클러져에 weak self를 쓰자
        let closeAction = UIAlertAction(title: "닫기", style: .destructive) { [weak self] _ in
            self?.dismiss(animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        [closeAction, cancelAction].forEach {
            alertController.addAction($0)
        }
        
        present(alertController, animated: true)
    }
}
