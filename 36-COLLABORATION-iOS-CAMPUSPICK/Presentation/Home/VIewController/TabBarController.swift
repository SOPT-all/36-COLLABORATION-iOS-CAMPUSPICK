//
//  TabBarController.swift
//  36-COLLABORATION-iOS-CAMPUSPICK
//
//  Created by 안치욱 on 5/16/25.
//

import UIKit
import SnapKit
import Then

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    private func setTabBar() {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: .homeDeact, selectedImage: .homeAct)
        
        let studyVC = StudyViewController()
        studyVC.tabBarItem = UITabBarItem(title: "스터디", image: .studyDeact, selectedImage: .studyAct)
        
        let communityVC = CommunityViewController()
        communityVC.tabBarItem = UITabBarItem(title: "커뮤니티", image: .communityDeact, selectedImage: .communityAct)
        
        let chatVC = ChatViewController()
        chatVC.tabBarItem = UITabBarItem(title: "채팅", image: .chatDeact, selectedImage: .chatAct)
        
        let myPageVC = MyPageViewController()
        myPageVC.tabBarItem = UITabBarItem(title: "마이", image: .mypageDeact, selectedImage: .mypageAct)
        
        viewControllers = [homeVC, studyVC, communityVC, chatVC, myPageVC]
    }
}
