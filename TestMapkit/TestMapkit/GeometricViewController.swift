//
//  GeometricViewController.swift
//  TestMapkit
//
//  Created by 박준하 on 2023/05/24.
//

import UIKit
import SnapKit
import Then

class GeometricViewController: UIViewController {
    
    private lazy var exNumber = UILabel().then {
        $0.text = "1, 2, 4, 8, 16\n\n-2, 4, -8, 16\n\n192, 96, 48, 24"
        $0.font = .systemFont(ofSize: 30.0, weight: .semibold)
        $0.textColor = .black
        $0.numberOfLines = 10
    }
    
    private lazy var justiceLabel = UILabel().then {
        $0.text = "정의"
        $0.font = .systemFont(ofSize: 30.0, weight: .semibold)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    private lazy var justiceTitle1 = UILabel().then {
        $0.text = "일정한 수를 곱하여 만든 수열 == 등비수열"
        $0.font = .systemFont(ofSize: 20.0, weight: .semibold)
        $0.textColor = .black
        $0.numberOfLines = 1
    }
    
    private lazy var justiceTitle2 = UILabel().then {
        $0.text = "곱하는 일정한 수 == 공비"
        $0.font = .systemFont(ofSize: 20.0, weight: .semibold)
        $0.textColor = .black
        $0.numberOfLines = 1
    }
    
    private lazy var justiceTitle3 = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 20.0, weight: .semibold)
        $0.textColor = .black
        $0.numberOfLines = 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let num1 = 2
        let num2 = 6
        let num3 = 18

        let sequences = findGeometricAndArithmeticSequences(num1, num2, num3)
        let geometricSequence = sequences.geometric
        let arithmeticSequence = sequences.arithmetic
        
        print("등비 수열: \(geometricSequence)")
        print("등차 수열: \(arithmeticSequence)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        [
            exNumber,
            justiceLabel,
            justiceTitle1,
            justiceTitle2
        ].forEach { view.addSubview($0) }
        
        exNumber.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100.0)
            $0.centerX.equalToSuperview()
        }
        
        justiceLabel.snp.makeConstraints {
            $0.top.equalTo(exNumber.snp.bottom).offset(50.0)
            $0.leading.equalToSuperview().offset(20.0)
        }
        
        justiceTitle1.snp.makeConstraints {
            $0.top.equalTo(justiceLabel.snp.bottom).offset(10.0)
            $0.centerX.equalToSuperview()
        }
        
        justiceTitle2.snp.makeConstraints {
            $0.top.equalTo(justiceTitle1).offset(30.0)
            $0.centerX.equalToSuperview()
        }
    }
    
    func findGeometricAndArithmeticSequences(_ num1: Int, _ num2: Int, _ num3: Int) -> (geometric: [Int], arithmetic: [Int]) {
        let diff1 = num2 - num1
        let diff2 = num3 - num2
        
        // 등비 수열 계산
        let commonRatio: Int
        if num1 != 0 {
            commonRatio = num2 / num1
        } else {
            commonRatio = 0
        }
        let geometricSequence = [num1, num1 * commonRatio, num1 * commonRatio * commonRatio]
        
        // 등차 수열 계산
        let arithmeticSequence = [num1, num1 + diff1, num1 + diff1 + diff2]
        
        return (geometricSequence, arithmeticSequence)
    }
}
