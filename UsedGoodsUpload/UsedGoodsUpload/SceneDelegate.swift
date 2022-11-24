//
//  SceneDelegate.swift
//  UsedGoodsUpload
//
//  Created by 박준하 on 2022/11/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = ( scene as? UIWindowScene ) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let rootViewController = MainViewContoller()
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        window?.makeKeyAndVisible()
    }

}

