//
//  MainNavigationController.swift
//  CowryWise Login Guide
//
//  Created by mac on 04/10/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit
class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let landingPageView = LandingPageViewController()
        viewControllers = [landingPageView]
    }
}
