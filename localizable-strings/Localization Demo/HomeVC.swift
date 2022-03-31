//
//  ViewController.swift
//  Localization Demo
//
//  Created by Andrew on 11/16/20.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    private(set) lazy var label: UILabel = makeLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        makeConstraints(view: label)
    }
}

private extension HomeVC {
    func makeLabel() -> UILabel {
        let label = UILabel()
        label.text = HomeString.buttonTitle.localized
        return label
    }
    
    func makeConstraints(view: UIView) {
        view.snp.makeConstraints {
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
            $0.centerY.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}



