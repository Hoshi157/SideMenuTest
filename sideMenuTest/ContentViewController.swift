//
//  ContentViewController.swift
//  sideMenuTest
//
//  Created by 福山帆士 on 2020/05/02.
//  Copyright © 2020 福山帆士. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    let sideMenuVC = SideMenuViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .blue
        
        self.addChild(sideMenuVC)
        self.view.addSubview(sideMenuVC.view)
        sideMenuVC.didMove(toParent: self)
        
        sideMenuVC.view.isHidden = true
        self.view.bringSubviewToFront(sideMenuVC.view)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(menuButtonAction(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(dismissButtonAction(_:)))
    }
    
    @objc func menuButtonAction(_ button: UIBarButtonItem) {
        presentsideMenu()
        print("tap")
    }
    
    @objc func dismissButtonAction(_ button: UIBarButtonItem) {
        dismissMenu()
    }
    
    // サイドメニュー開始
    func presentsideMenu() {
        // viewWillApperを呼び出す
        print("present")
        sideMenuVC.beginAppearanceTransition(true, animated: true)
        sideMenuVC.view.isHidden = false
        sideMenuVC.view.frame = sideMenuVC.view.frame.offsetBy(dx: -sideMenuVC.view.frame.size.width, dy: 0)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: {
            let bounds = self.sideMenuVC.view.bounds
            self.sideMenuVC.view.frame = CGRect(x: -bounds.size.width / 2, y: 0, width: bounds.size.width, height: bounds.size.height)
        }, completion: { _ in
            // viewDidApperを呼び出す
            self.sideMenuVC.endAppearanceTransition()
            print("completion")
        })
    }
    
    // サイドメニュー終了
    func dismissMenu() {
        print("dismiss")
        sideMenuVC.beginAppearanceTransition(false, animated: true)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.sideMenuVC.view.frame = self.sideMenuVC.view.frame.offsetBy(dx: -self.sideMenuVC.view.frame.size.width / 2, dy: 0)
        }, completion: {_ in
            self.sideMenuVC.view.isHidden = true
            self.sideMenuVC.endAppearanceTransition()
        })
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
