//
//  SceneDelegate.swift
//  sonmong
//
//  Created by 이은솔 on 3/23/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        // Guard 문을 사용하여 UIScene을 UIWindowScene 타입으로 다운캐스팅합니다.
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        
//        let registerVC = RegisterUserVC(reactor: RegisterUserReactor())
        let tabBarVC = UITabBarController()
        
        //각 탭과 연결될 네비게이션컨트롤러 설정
        let homeVC = HomeVC(reactor: HomeReactor())
        let qurationVC = QurationMainVC(reactor: QurationMainReactor())
        let loginVC = LoginVC(reactor: LoginReactor())
                
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: qurationVC)
        let nav3 = UINavigationController(rootViewController: loginVC)
        let nav4 = UINavigationController(rootViewController: loginVC)
        nav1.tabBarItem = UITabBarItem(title: "홈 ", image: UIImage(named: "home_export"), selectedImage: UIImage(named: "home_export_selected")?.withRenderingMode(.alwaysOriginal))
        nav2.tabBarItem = UITabBarItem(title: "AI상담 ", image: UIImage(named: "ai_export"), selectedImage: UIImage(named: "ai_export_selected")?.withRenderingMode(.alwaysOriginal))
        nav3.tabBarItem = UITabBarItem(title: "손몽이 ", image: UIImage(named: "sm_export"), selectedImage: UIImage(named: "sm_export_selected")?.withRenderingMode(.alwaysOriginal))
        nav4.tabBarItem = UITabBarItem(title: "마이 ", image: UIImage(named: "my_export"), selectedImage: UIImage(named: "my_export_selected")?.withRenderingMode(.alwaysOriginal) )
//        tabBarVC.viewControllers = [nav1, nav2, nav3, nav4]
        tabBarVC.viewControllers = [nav1, nav2]
        tabBarVC.tabBar.backgroundColor = Constant.Color.f1
        
        tabBarVC.tabBar.tintColor = Constant.Color.b1
        tabBarVC.tabBar.unselectedItemTintColor = Constant.Color.g4
         
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

