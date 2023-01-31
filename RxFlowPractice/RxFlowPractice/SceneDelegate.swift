//
//  SceneDelegate.swift
//  RxFlowPractice
//
//  Created by 박준하 on 2023/01/31.
//

import UIKit
import RxFlow
import RxSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator = FlowCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let appFlow = AppFlow(window: window)
        self.coordinator.coordinate(flow: appFlow, with: AppStepper())
        window.makeKeyAndVisible()
    }
}

