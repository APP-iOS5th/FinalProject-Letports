//
//  ViewController.swift
//  Letports
//
//  Created by mosi on 8/5/24.
//

import UIKit

class ViewController: UIViewController {

    private lazy var navigationView: CustomNavigationView = {
        let view = CustomNavigationView(isLargeNavi: .small, screenType: .smallCreateGathering(btnName: .create))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationView.delegate = self
        self.view.addSubview(navigationView)
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension ViewController: CustomNavigationDelegate {
    func smallRightButtonDidTap() {
    
    }
}
