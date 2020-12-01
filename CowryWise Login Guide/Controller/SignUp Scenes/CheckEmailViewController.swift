//
//  CheckEmailViewController.swift
//  CowryWise Login Guide
//
//  Created by mac on 29/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

class CheckEmailViewController: UIViewController {
    var navBar: UINavigationBar = UINavigationBar()
    let backButton: UIButton = {
        let image = UIImage(named: CheckEmailProperties.backButton)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(goToGuide), for: .touchUpInside)
        return button
    }()
    
    let titleLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.attributedText = NSAttributedString(string: CheckEmailProperties.titleLabel , attributes: CheckEmailProperties.titleLabelAttributes)
        return uiLabel
    }()
    
    let subtitleLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.attributedText = NSAttributedString(string: CheckEmailProperties.subtitleLabel, attributes: CheckEmailProperties.subtitleLabelAttributes)
        uiLabel.numberOfLines = 3
        return uiLabel
    }()
    
    lazy var verifiedEmailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(CheckEmailProperties.verifiedEmailButton, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = UIColor.rgb(red: 0, green: 100, blue: 237)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleVerifyEmailButtonClick), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        addCustomViews()
        configureCustomView()
        setUpNavigationItems()
    }
    
    private func addCustomViews() {
        view.addSubview(navBar)
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(verifiedEmailButton)
    }
    
    private func setUpNavigationItems() {
        self.navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 0)
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationController!.navigationBar.tintColor = .black
    }
    
    @objc func handleVerifyEmailButtonClick() {
        let viewController = LandingPageViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @objc func goToGuide() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func configureCustomView() {
        view.insetsLayoutMarginsFromSafeArea = false
        _ =  backButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 60, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        _ = titleLabel.anchor(backButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 50, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = subtitleLabel.anchor(titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        _ = verifiedEmailButton.anchor(subtitleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 60)
    }
}

