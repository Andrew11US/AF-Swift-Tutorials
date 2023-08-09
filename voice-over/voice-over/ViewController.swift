//
//  ViewController.swift
//  voice-over
//
//  Created by Andrew on 2023-08-09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var header1: UILabel!
    @IBOutlet weak var header2: UILabel!
    @IBOutlet weak var header3: UILabel!
    @IBOutlet weak var header4: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var focusButton: UIButton!
    @IBOutlet weak var longPressLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    private var colorIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    
    @IBAction func setStateSelected(_ sender: UIButton) {
        let isUnselected = sender.tintColor == .systemBlue
        sender.tintColor = isUnselected ? .systemRed : .systemBlue
        print("Button \(sender.titleLabel?.text ?? "") is selected \(sender.tintColor != .systemBlue)")
    }
    
    @IBAction func moveFocusOnTap(_ sender: UIButton) {
        
    }
    
    @IBAction func longPressToChangeColor(_ sender: UITapGestureRecognizer) {
        let colors: [UIColor] = [.red, .green, .blue, .orange, .gray, .brown]
        longPressLabel.backgroundColor = colors[colorIndex % 6]
        colorIndex += 1
    }
}

