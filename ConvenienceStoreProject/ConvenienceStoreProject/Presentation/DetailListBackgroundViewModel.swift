//
//  DetailListBackgroundViewModel.swift
//  ConvenienceStoreProject
//
//  Created by 박준하 on 2023/01/16.
//

import RxRelay
import RxSwift
import RxCocoa
import UIKit

struct DetailListBackgroundViewModel {
    //viewModel -> view
    let isStatusLabelHidden: Signal<Bool>
    
    //외부에서 전달받는 값전달
    let shouldHideStatusLabel = PublishSubject<Bool>()
    
    init() {
        isStatusLabelHidden = shouldHideStatusLabel
            .asSignal(onErrorJustReturn: true)
    }
}
