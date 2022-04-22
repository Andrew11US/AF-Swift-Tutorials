//
//  ViewController.swift
//  custom-navigation-bar
//
//  Created by Andrew on 2022-04-22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
}

extension ViewController {
    func makeNavigationBar() -> UIView {
        lazy var logoImageView: UIImageView = {
            let imageView = UIImageView()
            let image = UIImage(systemName: "camera.macro.circle.fill")
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
            return imageView
        }()
        
        lazy var spacer: UIView = {
            let spacer = UIView()
            let constraint = spacer.widthAnchor.constraint(greaterThanOrEqualToConstant: CGFloat.greatestFiniteMagnitude)
            constraint.isActive = true
            constraint.priority = .defaultLow
            return spacer
        }()
        
        let stackView = UIStackView()
        stackView.backgroundColor = .lightGray
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(spacer)
        return stackView
    }
    
    func addNavigationBar() -> Self {
        let navigationBar = makeNavigationBar()
        navigationItem.titleView = navigationBar
        return self
    }
}

// MARK: - Instantiation from Storyboard
extension UIViewController {
    static func instantiate(storyboardName: String) -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateInitialViewController() as! Self
    }
}
