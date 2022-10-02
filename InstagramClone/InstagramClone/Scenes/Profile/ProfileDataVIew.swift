//
//  ProfileDataVIew.swift
//  InstagramClone
//
//  Created by 박준하 on 2022/10/02.
//

import SnapKit
import UIKit

final class ProfileDataView: UIView {
    private let title: String
    private let count: Int
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.text = title
        
        return label
    }()
    
    private lazy var conuntLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.text = "\(count)"
        
        return label
    }()
    
    init(title: String, count: Int) {
        self.title = title
        self.count = count
        super.init(frame: .zero)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ProfileDataView {
    func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [conuntLabel,titleLabel])
        //방향은 세로방향
        stackView.axis = .vertical
        //스택뷰의 정렬은 center
        stackView.alignment = .center
        //스택뷰의 간격은 4
        stackView.spacing = 4.0
        
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
