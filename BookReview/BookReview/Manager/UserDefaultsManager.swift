//
//  UserDefaultsManager.swift
//  BookReview
//
//  Created by 박준하 on 2023/04/06.
//

import Foundation

protocol UserDefaultsManagerProtocol {
    func getReviews() -> [BookReView]
    func setReview(_ newValue: BookReView)
}

struct UserDefaultsManager: UserDefaultsManagerProtocol {
    
    enum Key: String {
        case review
    }
    
    func getReviews() -> [BookReView] {
        guard let data = UserDefaults.standard.data(forKey: Key.review.rawValue) else { return [] }
        
        return (try? PropertyListDecoder().decode([BookReView].self, from: data)) ?? []
    }
    
    func setReview(_ newValue: BookReView) {
        var currentReviews: [BookReView] = getReviews()
        currentReviews.insert(newValue, at: 0)
        
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(currentReviews),
                                       forKey: Key.review.rawValue)
    }
    
    
}
