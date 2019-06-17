//
//  ViewController.swift
//  HereHearV2
//
//  Created by Frank Liu on 2019/6/12.
//  Copyright © 2019 Frank Liu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Lottie

var homeVC:UIViewController!

class RootViewController: BaseViewController {
    
    @IBOutlet weak var tabBarView:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.playMainPage()
        homeVC = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func sayStory() {
        let vc = SayStoryViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func playMainPage() {
        let animationView = AnimationView(name: "MainPage")
        animationView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        // animationView.center = self.playView.center
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        self.view.addSubview(animationView)
        animationView.play()
        self.tabBarView.frame = CGRect(x: 0, y: self.view.frame.size.height - 130, width: self.view.frame.size.width, height: 130 )
        animationView.addSubview(self.tabBarView)
    }
    
//    func setupTabBar() {
//        let vc1 = ListenStoryViewController()
//        let nav1 = UINavigationController(rootViewController: vc1)
//        let firstViewController = nav1
//        firstViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("tab1Str", comment: ""), image: UIImage(named: "tab1"), selectedImage: UIImage(named: "tab1"))
//
//        let vc2 = ActivityViewController()
//        let nav2 = UINavigationController(rootViewController: vc2)
//        let secondViewController = nav2
//        secondViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("tab2Str", comment: ""), image: UIImage(named: "tab2"), selectedImage: UIImage(named: "tab2"))
//
//        let vc3 = SayStoryViewController()
//        let nav3 = UINavigationController(rootViewController: vc3)
//        let thirdViewController = nav3
//        thirdViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("tab3Str", comment: ""), image: nil, selectedImage: nil)
//
//        let vc4 = AnalysisViewController()
//        let nav4 = UINavigationController(rootViewController: vc4)
//        let forthViewController = nav4
//        forthViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("tab4Str", comment: ""), image: UIImage(named: "tab3"), selectedImage: UIImage(named: "tab3"))
//
//        let vc5 = MoreViewController()
//        let nav5 = UINavigationController(rootViewController: vc5)
//        let fifthViewController = nav5
//        fifthViewController.tabBarItem = UITabBarItem(title: NSLocalizedString("tab5Str", comment: ""), image: UIImage(named: "tab4"), selectedImage: UIImage(named: "tab4"))
//
//        let tabBarList = [firstViewController, secondViewController, thirdViewController, forthViewController, fifthViewController]
//
//        viewControllers = tabBarList
//        self.tabBar.layer.borderWidth = 0.5
//        self.tabBar.layer.borderColor = UIColor.clear.cgColor
//        self.tabBar.clipsToBounds = true
//        self.selectedIndex = 2
//        self.tabBar.backgroundImage = UIImage(named: "tabbar")
//    }
}

