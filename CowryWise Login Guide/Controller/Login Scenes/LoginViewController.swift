//
//  LoginViewController.swift
//  CowryWise Login Guide
//
//  Created by mac on 29/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginDataProtocol {
    var navBar: UINavigationBar = UINavigationBar()
    var validation = FormValidation()
    var onClick = true
    var loginId: String?
    
    let cancelButton: UIButton = {
        let image = UIImage(named: LoginPageButtons.cancelButtonImage)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(goToGuide), for: .touchUpInside)
        return button
    }()
    let titleLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.attributedText = NSAttributedString(string: LoginPageTexts.titleLabelText , attributes: LoginPageAttributes.titleLabelAttributes)
        return uiLabel
    }()
    let subtitleLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.attributedText = NSAttributedString(string:LoginPageTexts.subtitleLabelText, attributes: LoginPageAttributes.subtitleLabelAttributes)
        return uiLabel
    }()
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = LoginPageAttributes.loginFormPlaceholders
        textField.placeholder = LoginPageTexts.emailTextField
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: 50 - 1, width: 380, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    let emailErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "Inavlid email address!"
        label.textColor = .red
        return label
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = LoginPageAttributes.loginFormPlaceholders
        textField.placeholder = LoginPageTexts.passwordTextField
        textField.isSecureTextEntry = true
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: 50 - 1, width: 380, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    let passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "Invalid password!"
        label.textColor = .red
        return label
    }()
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fill
        
        let showPasswordButton: UIButton = {
            let button = UIButton()
            button.setTitle(LoginPageTexts.showPasswordLabel , for: .normal)
            button.backgroundColor = .clear
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
            return button
        }()
        let forgotPasswordLabel: UILabel = {
            let label = UILabel()
            label.text = LoginPageTexts.forgotPasswordLabel
            label.textAlignment = .right
            label.textColor = .white
            return label
        }()
        stackView.addArrangedSubview(showPasswordButton)
        stackView.addArrangedSubview(forgotPasswordLabel)
        _ = showPasswordButton.anchor(nil, left: stackView.rightAnchor, bottom: nil, right: forgotPasswordLabel.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        _ = forgotPasswordLabel.anchor(nil, left: showPasswordButton.rightAnchor, bottom: nil, right: stackView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        return stackView
    }()
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(LoginPageButtons.loginButtonText,for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(goToWelcomePage), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 0, green: 100, blue: 237)
        self.navigationController?.isNavigationBarHidden = true
        addCustomViews()
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        configureCustomView()
        setUpNavigationItems()
    }
    func getLoginData(response: LoginDataModel) {
        loginId = response.id
    }
    
    private func addCustomViews() {
        view.addSubview(cancelButton)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(emailTextField)
        view.addSubview(emailErrorLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordErrorLabel)
        view.addSubview(stackView)
        view.addSubview(loginButton)
        view.addSubview(navBar)
    }
    @objc func togglePasswordVisibility() {
        if onClick == true {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
        onClick = !onClick
    }
    func wrongNetworkCall() {
        let alertController = UIAlertController(
            title: "🚨", message: "Wrong network call!", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    @objc func goToWelcomePage() {
        let loginDataGetter = LoginDataGetter()
        loginDataGetter.loginDataDelegate = self
        loginDataGetter.getData()
        if passwordTextField.text != "" && emailTextField.text != "" {
            if loginId != nil {
                let viewController = WelcomePageViewController()
                self.navigationController?.pushViewController(viewController, animated: true)
            }
            else {
                wrongNetworkCall()
            }
        }
        else {
            guard let email = self.emailTextField.text, let password = self.passwordTextField.text else {
                return
            }
            let isValidEmail = self.validation.validateEmailAddress(email)
            let isValidPassword = self.validation.validatePassword(password)
            if isValidEmail == false {
                self.emailTextField.placeholder = ""
                self.emailTextField.attributedPlaceholder = LoginPageAttributes.emptyPlaceholder
                emailErrorLabel.isHidden = false
                if  isValidPassword == false {
                    passwordErrorLabel.isHidden = false
                    self.passwordTextField.placeholder = ""
                }
                if isValidEmail == true && isValidPassword == true {
                    emailErrorLabel.isHidden = true
                    passwordErrorLabel.isHidden = true
                    //            page to open
                    let viewController = WelcomePageViewController()
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
                if self.emailTextField.text != "" {
                    emailErrorLabel.isHidden = true
                }
                if self.passwordTextField.text != "" {
                    passwordErrorLabel.isHidden = true
                }
            }
        }
    }
        @objc func goToGuide() {
            let viewController = LandingPageViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        private func setUpNavigationItems() {
            self.navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 0)
            self.navigationController!.navigationBar.isTranslucent = true
            self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
            self.navigationController!.navigationBar.tintColor = .black
        }
        private func configureCustomView() {
            view.insetsLayoutMarginsFromSafeArea = false
            _ =  cancelButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 60, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
            _ = titleLabel.anchor(cancelButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 50, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            _ = subtitleLabel.anchor(titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
            _ = emailTextField.anchor(subtitleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 50)
            _ = emailErrorLabel.anchor(emailTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 50)
            _ = passwordTextField.anchor(emailTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 50)
            _ = passwordErrorLabel.anchor(passwordTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 50)
            _ = stackView.anchor(passwordTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 50)
            _ = loginButton.anchor(stackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 50)
        }
    }
