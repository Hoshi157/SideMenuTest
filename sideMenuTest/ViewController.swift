//
//  ViewController.swift
//  sideMenuTest
//
//  Created by 福山帆士 on 2020/05/02.
//  Copyright © 2020 福山帆士. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let sideMenuVC = SideMenuViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .red
        
        let contentVC = self.storyboard?.instantiateViewController(identifier: "content")
        self.addChild(contentVC!)
        self.view.addSubview(contentVC!.view)
        contentVC!.didMove(toParent: self)
        
    }
    
}

