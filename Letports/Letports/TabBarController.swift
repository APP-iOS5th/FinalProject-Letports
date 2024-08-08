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
    }
    
    private func setupVC() {
        
        let homeVC = setupNav(for: HomeVC(), title: "홈", image: UIImage(systemName: "house"))
        let gatheringVC = setupNav(for: GatheringVC(), title: "소모임", image: UIImage(systemName: "person.3"))
        let profileVC = setupNav(for: ProfileVC(), title: "프로필", image: UIImage(systemName: "person"))
        
        viewControllers = [homeVC, gatheringVC, profileVC]
    }
    
    private func setupNav(for rootVC: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootVC)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
}
