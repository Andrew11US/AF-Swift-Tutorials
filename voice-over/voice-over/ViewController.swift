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
    @IBOutlet weak var header5: UILabel!
    
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
    @IBOutlet weak var announcementButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    private var colorIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAccessibility()
    }

    // MARK: - Actions
    
    @IBAction func setStateSelected(_ sender: UIButton) {
        let isUnselected = sender.tintColor == .systemBlue
        sender.tintColor = isUnselected ? .systemRed : .systemBlue
        let isSelected = sender.tintColor == .systemRed
        print("Button \(sender.titleLabel?.text ?? "") is selected \(isSelected)")
        // Convey selected state
        sender.accessibilityValue = isSelected ? "Selected" : nil
    }
    
    @IBAction func moveFocusOnTap(_ sender: UIButton) {
        // Move focus
        UIAccessibility.post(notification: .layoutChanged, argument: imageView)
    }
    
    @IBAction func longPressToChangeColor(_ sender: UITapGestureRecognizer) {
        let colors: [UIColor] = [.red, .green, .blue, .orange, .gray, .brown]
        longPressLabel.backgroundColor = colors[colorIndex % 6]
        colorIndex += 1
    }
    
    @IBAction func makeAnnouncement(_ sender: UIButton) {
        // Announcement
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIAccessibility.post(notification: .announcement, argument: "This is a test announcement")
        }
    }
    
    // MARK: - Accessibility
    private func setupAccessibility() {
        // Headers
        let headers = [header1, header2, header3, header4, header5]
        headers.forEach { $0?.accessibilityTraits = .header }
        
        // Enable image accessibility
        imageView.isAccessibilityElement = true
        imageView.accessibilityTraits = .image
        imageView.accessibilityLabel = "Picture of a mountain"
        imageView.accessibilityIdentifier = UUID().uuidString
        print("Image ID: \(imageView.accessibilityIdentifier ?? "###")")
        
        // Custom element order
        let elements = [header1, button1, button2, button3, button4, button5, button6, button7, button8, button9, header2, focusButton, header3, longPressLabel, header4, announcementButton, header5, imageView]
        view.accessibilityElements = elements as [Any]
        
        // Custom action
        let changeColorAction = UIAccessibilityCustomAction(name: "Change color action", target: self, selector: #selector(longPressToChangeColor(_:)))
        longPressLabel.accessibilityCustomActions = [changeColorAction]
        
        // Accessibility hint
        focusButton.accessibilityHint = "Double tap to move focus onto the mountain image"
    }
}

