//
//  ViewController.swift
//  Binding Demo
//
//  Created by Andrew on 2022-02-04.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var colorLbl: UILabel!

    // Properties
    var viewModel: CatViewModel!
    var cancellabes: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBindings()
    }
    
    func setBindings() {
        viewModel.didChangeData = { [unowned self] viewModel in
            self.nameLbl.text = viewModel.name
        }
        
        viewModel.age.bind { age in
            self.ageLbl.text = String(age)
        }
        
        viewModel.$color
            .compactMap { String($0) }
            .assign(to: \.text, on: colorLbl)
            .store(in: &cancellabes)
    }

    @IBAction func showDataTapped(_ sender: UIButton) {
        viewModel.showData()
    }
}

// MARK: - ViewController extensions

extension UIViewController {
    static func instantiate(storyboardName: String = "Main") -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateInitialViewController() as! Self
    }
}

