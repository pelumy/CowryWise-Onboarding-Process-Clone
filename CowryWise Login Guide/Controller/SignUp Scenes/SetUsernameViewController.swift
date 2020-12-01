//
//  SetUsernameViewController.swift
//  CowryWise Login Guide
//
//  Created by mac on 29/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

class SetUsernameViewController: UIViewController {
    var navBar: UINavigationBar = UINavigationBar()
    let backButton: UIButton = {
        let image = UIImage(named: SetUsernameProperties.backButton)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(goToGuide), for: .touchUpInside)
        return button
    }()
    let titleLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.attributedText = NSAttributedString(string:SetUsernameProperties.titleLabel , attributes: SetUsernameProperties.titleLabelAttributes)
        return uiLabel
    }()
    let subtitleLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.attributedText = NSAttributedString(string: SetUsernameProperties.subtitleLabel, attributes: SetUsernameProperties.subtitleLabelAttributes)
        uiLabel.numberOfLines = 2
        return uiLabel
    }()
    let userNameTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = SetUsernameProperties.userNameTextField
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: 50 - 1, width: 380, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    let userNameErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "You must enter a username!"
        label.textColor = .red
        return label
    }()
    lazy var importanceLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.attributedText = NSAttributedString(string: SetUsernameProperties.importanceLabel , attributes: SigningupProperties.inviteCodeLabelAttributes)
        uiLabel.textAlignment = .left
        return uiLabel
    }()
    let freeCashLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.textColor = .lightGray
        uiLabel.textAlignment = .center
        uiLabel.attributedText = TextFieldHelpers.freeCashLabel()
        return uiLabel
    }()
    let personalizedUsernameLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.textColor = .lightGray
        uiLabel.numberOfLines = 2
        uiLabel.attributedText = TextFieldHelpers.personalisedUsernameLabel()
        return uiLabel
    }()
    lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(SetUsernameProperties.continueButton, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor.rgb(red: 0, green: 100, blue: 237)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleContinueButtonClick), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        addCustomViews()
        configureCustomView()
        setUpNavigationItems()
        userNameErrorLabel.isHidden = true
    }
    private func addCustomViews() {
        view.addSubview(navBar)
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(userNameTextField)
        view.addSubview(userNameErrorLabel)
        view.addSubview(importanceLabel)
        view.addSubview(freeCashLabel)
        view.addSubview(personalizedUsernameLabel)
        view.addSubview(continueButton)
    }
    private func setUpNavigationItems() {
        self.navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 0)
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationController!.navigationBar.tintColor = .black
    }
    @objc func handleContinueButtonClick() {
        if userNameTextField.text != "" {
            let viewController = EmailConfirmationViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        else {
            userNameErrorLabel.isHidden = false
        }
    }
    @objc func goToGuide() {
        self.navigationController?.popViewController(animated: true)
    }
    private func configureCustomView() {
        view.insetsLayoutMarginsFromSafeArea = false
        _ =  backButton.anchor(view.topAnchor,
            left: view.leftAnchor, bottom: nil, right: nil, topConstant: 60,
            leftConstant: 10, bottomConstant: 0,
            rightConstant: 0, widthConstant: 50, heightConstant: 50)
        _ = titleLabel.anchor(backButton.bottomAnchor,
            left: view.leftAnchor, bottom: nil,
            right: view.rightAnchor, topConstant: 50,
            leftConstant: 15, bottomConstant: 0,
            rightConstant: 0, widthConstant: 0, heightConstant: 0)
        _ = subtitleLabel.anchor(titleLabel.bottomAnchor,
            left: view.leftAnchor, bottom: nil,
            right: view.rightAnchor, topConstant: 10,
            leftConstant: 15, bottomConstant: 0,
            rightConstant: 15, widthConstant: 0, heightConstant: 0)
        _ = userNameTextField.anchor(subtitleLabel.bottomAnchor,
            left: view.leftAnchor, bottom: nil,
            right: view.rightAnchor, topConstant: 40,
            leftConstant: 15, bottomConstant: 0,
            rightConstant: 15, widthConstant: 0, heightConstant: 50)
        _ = userNameErrorLabel.anchor(userNameTextField.bottomAnchor,
            left: view.leftAnchor, bottom: nil, right: view.rightAnchor,
            topConstant: 0, leftConstant: 15, bottomConstant: 0,
            rightConstant: 15, widthConstant: 0, heightConstant: 0)
        _ = importanceLabel.anchor(userNameTextField.bottomAnchor,
            left: view.leftAnchor,
            bottom: nil, right: view.rightAnchor, topConstant: 30,
            leftConstant: 15, bottomConstant: 0,
            rightConstant: 15, widthConstant: 0, heightConstant: 0)
        _ = freeCashLabel.anchor(importanceLabel.bottomAnchor,
            left: view.leftAnchor, bottom: nil, right: nil,
            topConstant: 35, leftConstant: 15, bottomConstant: 0,
            rightConstant: 0, widthConstant: 0, heightConstant: 0)
        _ = personalizedUsernameLabel.anchor(freeCashLabel.bottomAnchor,
            left: view.leftAnchor, bottom: nil, right: nil, topConstant: 35,
            leftConstant: 15, bottomConstant: 0, rightConstant: 0,
            widthConstant: 0, heightConstant: 0)
        _ = continueButton.anchor(nil, left: view.leftAnchor,
            bottom: view.bottomAnchor, right: view.rightAnchor,
            topConstant: 0, leftConstant: 15, bottomConstant: 90,
            rightConstant: 15, widthConstant: 0, heightConstant: 60)
    }
}
