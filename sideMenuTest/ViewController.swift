//
//  ViewController.swift
//  sideMenuTest
//
//  Created by 福山帆士 on 2020/05/02.
//  Copyright © 2020 福山帆士. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let contentVC = ContentViewController()
    let sideMenuVC = SideMenuViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .red
        
        self.addChild(contentVC)
        self.view.addSubview(contentVC.view)
        contentVC.didMove(toParent: self)
        
        self.addChild(sideMenuVC)
        self.view.addSubview(sideMenuVC.view)
        sideMenuVC.didMove(toParent: self)
        
        sideMenuVC.view.isHidden = true
        self.view.bringSubviewToFront(sideMenuVC.view)
        
        presentsideMenu()
    }
    
    // 再度メニュー開始
    func presentsideMenu() {
        // viewWillApperを呼び出す
        sideMenuVC.beginAppearanceTransition(true, animated: true)
        sideMenuVC.view.isHidden = false
        sideMenuVC.view.frame = sideMenuVC.view.frame.offsetBy(dx: -sideMenuVC.view.frame.size.width, dy: 0)
        UIView.animate(withDuration: 0.3, delay: 2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
            let bounds = self.sideMenuVC.view.bounds
            self.sideMenuVC.view.frame = CGRect(x: -bounds.size.width / 2, y: 0, width: bounds.size.width, height: bounds.size.height)
        }, completion: { _ in
            // viewDidApperを呼び出す
            self.sideMenuVC.endAppearanceTransition()
        })
    }


}

