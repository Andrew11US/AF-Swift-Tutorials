//
//  RenderedVC.swift
//  xcode-15
//
//  Created by Andrew on 2023-09-03.
//

import UIKit

class RenderedVC: UIViewController {
    
    private lazy var label: UILabel = {
        var label = UILabel(frame: view.bounds)
        label.text = String(localized:  "UIViewController rendered using preview")
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        view.addSubview(label)
    }
}

#Preview("RenderedVC") {
    RenderedVC()
}
