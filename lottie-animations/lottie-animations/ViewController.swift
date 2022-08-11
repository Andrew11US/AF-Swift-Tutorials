//
//  ViewController.swift
//  lottie-animations
//
//  Created by Andrew on 2022-08-10.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    private var animationView: AnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAnimationView()
    }

    func setupAnimationView() {
        animationView = .init(name: "115478-webdesign-support")
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 1.0
        view.addSubview(animationView)
        animationView.play()
    }
}

