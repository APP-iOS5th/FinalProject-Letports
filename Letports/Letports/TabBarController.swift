//
//  TabBarController.swift
//  Letports
//
//  Created by John Yun on 8/8/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        tabBar.tintColor = .lpMain
    }
    
    private func setupVC() {
        let homeVC = setupNav(for: HomeVC(),
                              title: "홈",
                              image: UIImage(systemName: "house"),
                              selectedImage: UIImage(systemName: "house.fill"))
        
        let gatheringVC = setupNav(for: GatheringVC(),
                                   title: "소모임",
                                   image: UIImage(systemName: "person.3"),
                                   selectedImage: UIImage(systemName: "person.3.fill"))
        
        let profileVC = setupNav(for: ProfileVC(),
                                 title: "프로필",
                                 image: UIImage(systemName: "person"),
                                 selectedImage: UIImage(systemName: "person.fill"))
        
        viewControllers = [homeVC, gatheringVC, profileVC]
    }
    
    private func setupNav(for rootVC: UIViewController,
                          title: String,
                          image: UIImage?,
                          selectedImage: UIImage? = nil) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootVC)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}
