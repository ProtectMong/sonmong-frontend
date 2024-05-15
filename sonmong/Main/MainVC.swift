//
//  MainVC.swift
//  sonmong
//
//  Created by 이은솔 on 5/1/24.
//

import Foundation
import UIKit
import RxSwift
import ReactorKit

class MainVC: UITabBarController {
    var disposeBag = DisposeBag()
    
    // 각 탭과 연결될 네비게이션컨트롤러 설정
    let homeVC = UINavigationController(rootViewController: HomeVC(reactor: HomeReactor())) 
    let qurationVC = UINavigationController(rootViewController: QurationMainVC(reactor: QurationMainReactor()))
    let myPageVC = UINavigationController(rootViewController:MyPageVC(reactor: MyPageReactor()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeVC.tabBarItem = UITabBarItem(title: "홈 ", image: UIImage(named: "home_export"), selectedImage: UIImage(named: "home_export_selected")?.withRenderingMode(.alwaysOriginal))
        qurationVC.tabBarItem = UITabBarItem(title: "AI상담 ", image: UIImage(named: "ai_export"), selectedImage: UIImage(named: "ai_export_selected")?.withRenderingMode(.alwaysOriginal))
//        loginVC.tabBarItem = UITabBarItem(title: "손몽이 ", image: UIImage(named: "sm_export"), selectedImage: UIImage(named: "sm_export_selected")?.withRenderingMode(.alwaysOriginal))
        myPageVC.tabBarItem = UITabBarItem(title: "마이 ", image: UIImage(named: "my_export"), selectedImage: UIImage(named: "my_export_selected")?.withRenderingMode(.alwaysOriginal) )
        self.viewControllers = [homeVC, qurationVC, myPageVC]
        self.tabBar.backgroundColor = Constant.Color.f1
        
        self.tabBar.tintColor = Constant.Color.b1
        self.tabBar.unselectedItemTintColor = Constant.Color.g4
    }
}
