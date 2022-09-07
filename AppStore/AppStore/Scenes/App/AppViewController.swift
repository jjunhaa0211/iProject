//
//  AppViewController.swift
//  AppStore
//
//  Created by 박준하 on 2022/09/05.
//

import UIKit
import SnapKit

final class AppViewController : UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        //세로로 내리기
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let featureSectionView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = UIView()
        let exchangeCodeButtonView = UIView()
        
        rankingFeatureSectionView.backgroundColor = .yellow
        exchangeCodeButtonView.backgroundColor = .blue
        
        [
            featureSectionView,
            rankingFeatureSectionView,
            exchangeCodeButtonView
                
        ].forEach {
            $0.snp.makeConstraints { $0.height.equalTo(500)}
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationCotroller()
        setupLayout()
    }
}

private extension AppViewController {
    func setupNavigationCotroller() {
        navigationItem.title = "앱"
        navigationItem.largeTitleDisplayMode = .always
        //라지 타이틀만 보이게하기
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
