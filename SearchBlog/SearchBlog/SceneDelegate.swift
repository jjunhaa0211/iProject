//
//  SceneDelegate.swift
//  SearchBlog
//
//  Created by 박준하 on 2022/10/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
                window = UIWindow(frame: UIScreen.main.bounds)
                window?.windowScene = windowScene
                window?.rootViewController = ViewController()
                window?.makeKeyAndVisible()
    }
}

