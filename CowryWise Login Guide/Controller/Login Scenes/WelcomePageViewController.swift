//
//  WelcomePageViewController.swift
//  CowryWise Login Guide
//
//  Created by mac on 29/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

class WelcomePageViewController: UIViewController {
    var navBar: UINavigationBar = UINavigationBar()
    let cancelButton: UIButton = {
        let image = UIImage(named: WelcomePageProperties.cancelButton)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(goToProfilePage), for: .touchUpInside)
        return button
    }()
    
    let logo: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: WelcomePageProperties.logo)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.attributedText = WelcomePageProperties.welcomeMessage()
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCustomViews()
        configureCustomView()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        setUpNavigationItems()
    }
    
    private func addCustomViews() {
        view.addSubview(cancelButton)
        view.addSubview(logo)
        view.addSubview(textView)
        view.addSubview(navBar)
    }
    
    private func setUpNavigationItems() {
        self.navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 0)
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationController!.navigationBar.tintColor = .black
    }
    
    @objc func goToProfilePage() {
        let viewController = ProfilePageViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func configureCustomView() {
        view.insetsLayoutMarginsFromSafeArea = false
        
        _ =  cancelButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 60, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 50, heightConstant: 50)
        
        _ = logo.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 95, leftConstant: 0, bottomConstant: 0, rightConstant: 205, widthConstant: 0, heightConstant: 0)
        
        _ = textView.anchor(cancelButton.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 180, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
