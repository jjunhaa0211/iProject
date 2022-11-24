//
//  PriceTextFieldCellViewModel.swift
//  UsedGoodsUpload
//
//  Created by 박준하 on 2022/11/24.
//

import RxCocoa
import RxSwift

struct PriceTextFieldCellViewModel {
    let showFreeShareButton: Signal<Bool>
    let resetPrice: Signal<Void>
    let priceValue = PublishRelay<String?>()
    let freeShareButtonTapped = PublishRelay<Void>()
    
    init() {
        self.showFreeShareButton = Observable
            .merge(
                priceValue.map { $0 ?? "" == "0" },
                freeShareButtonTapped.map { _ in false }
            )
            .asSignal(onErrorJustReturn: false)
        
        self.resetPrice = freeShareButtonTapped
            .asSignal(onErrorSignalWith: .empty())
    }
}
