//
//  ViewController.swift
//  facade-pattern
//
//  Created by Andrew on 2022-08-10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    let imageURLString = "https://cdn.pixabay.com/photo/2013/11/15/13/57/road-210913_1280.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1 - Complex Interface
        loadImage()
        
        // 2 - Facade
        Facade().setImage(imageView: imageView, url: imageURLString)
        
        // 3 - Extension
        imageView.setImageFrom(url: imageURLString)
    }
    
    func loadImage() {
        Task {
            let imageLoader = ImageLoader()
            let image = await imageLoader.downloadImage(url: imageURLString)
            imageView.image = image
        }
    }
}

struct ImageLoader {
    func downloadImage(url: String) async -> UIImage? {
        guard let url = URL(string: url) else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return UIImage(data: data)
        } catch let error {
            print(error.localizedDescription)
        }
        
        return nil
    }
}

@MainActor
struct Facade {
    func setImage(imageView: UIImageView, url: String) {
        Task {
            let imageLoader = ImageLoader()
            let image = await imageLoader.downloadImage(url: url)
            imageView.image = image
        }
    }
}

extension UIImageView {
    func setImageFrom(url: String) {
        Task {
            let imageLoader = ImageLoader()
            let image = await imageLoader.downloadImage(url: url)
            self.image = image
        }
    }
}
