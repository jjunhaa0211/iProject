//
//  LocationInformationViewModel.swift
//  ConvenienceStoreProject
//
//  Created by 박준하 on 2023/01/16.
//

import RxCocoa
import RxSwift
import RxRelay

struct LocationInformationViewModel {
    let disposeBag = DisposeBag()
    
    //viewModel -> view
    let setMapCenter: Signal<MTMapPoint>
    let errorMassge: Signal<String>
    
    //view -> viewModel
    let currentLocation = PublishRelay<MTMapPoint>()
    let mapCenterPoint = PublishRelay<MTMapPoint>()
    let selectPOIItem = PublishRelay<MTMapPOIItem>()
    let mapViewError = PublishRelay<String>()
    let currentLocationButtonTapped = PublishRelay<Void>()
    
    init() {
        let moveToCurrentLocation = currentLocationButtonTapped
            .withLatestFrom(currentLocation)
        
        let currentMapCenter = Observable
            .merge(
                currentLocation.take(1),
                moveToCurrentLocation
            )
        
        setMapCenter = currentMapCenter
            .asSignal(onErrorSignalWith: .empty())
        
        errorMassge = mapViewError.asObservable()
            .asSignal(onErrorJustReturn: "잠시 후 다시 시도해주세요")
    }
}
