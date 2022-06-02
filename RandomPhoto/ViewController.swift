//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Nguyễn Công Thư on 02/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("random photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemPink,
        .systemBlue,
        .systemRed,
        .systemGray,
        .systemBrown,
        .systemYellow,
        .systemPurple
    ]
    
    @objc func didTapButton () {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        getRandomPhoto()
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton),
                         for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
                              width: view.frame.size.width - 40,
                              height: 55)
    }
    
    func getRandomPhoto () {
        let urlString =
        "https://source.unsplash.com/random/800x800"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }


}

