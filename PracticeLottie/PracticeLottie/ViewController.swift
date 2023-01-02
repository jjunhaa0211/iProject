//
//  ViewController.swift
//  PracticeLottie
//
//  Created by 박준하 on 2023/01/02.
//

import UIKit
import SnapKit
import Then
import Lottie

class ViewController: UIViewController {

    // 1. Create the AnimationView
    private var animationView: LottieAnimationView?

    override func viewDidLoad() {

      super.viewDidLoad()
      
      // 2. Start AnimationView with animation name (without extension)
      
      animationView = .init(name: "running")
      
      animationView!.frame = view.bounds
      
      // 3. Set animation content mode
      
      animationView!.contentMode = .scaleAspectFit
      
      // 4. Set animation loop mode
      
      animationView!.loopMode = .loop
      
      // 5. Adjust animation speed
      
        animationView!.animationSpeed = 0.5
      
      view.addSubview(animationView!)
      
      // 6. Play animation
      
      animationView!.play()
      
    }


}

