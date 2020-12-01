//
//  IsSigningupWithDetails.swift
//  CowryWise Login Guide
//
//  Created by mac on 28/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

class SigningupWithDetailsViewController: UIViewController {
    var navBar: UINavigationBar = UINavigationBar()
    var onClick = true
    var validation = FormValidation()
    let cancelButton: UIButton = {
        let image = UIImage(named: SigningupProperties.cancelButton)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(goToGuide), for: .touchUpInside)
        return button
    }()
    
    let titleLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.attributedText = NSAttributedString(string: SigningupProperties.titleLabel , attributes: SigningupProperties.titleLabelAttributes)
        return uiLabel
    }()
    
    let subtitleLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.attributedText = NSAttributedString(string: SigningupProperties.subtitleLabel, attributes: SigningupProperties.subtitleLabelAttributes)
        return uiLabel
    }()
    
    let firstNameTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = SigningupProperties.firstNameTextField
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: 50 - 1, width: 170, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    let firstNameErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter first name!"
        label.textColor = .red
        return label
    }()
    
    let lastNameTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = SigningupProperties.lastNameTextField
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 50 - 1, width: 190, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    let lastNameErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter last name!"
        label.textColor = .red
        return label
    }()
    
    let emailTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = SigningupProperties.emailTextField
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: 50 - 1, width: 380, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    let emailErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "You must enter a valid email address!"
        label.textColor = .red
        return label
    }()
    
    let passwordTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = SigningupProperties.passwordTextField
        textField.isSecureTextEntry = true
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: 50 - 1, width: 380, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    let showPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show" , for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.lightGray, for: .normal)
        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        return button
    }()
    
    let passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "You must enter a password!"
        label.textColor = .red
        return label
    }()
    
    let phoneNumberTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = SigningupProperties.phoneNumberTextField
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: 50 - 1, width: 380, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.borderStyle = UITextField.BorderStyle.none
        textField.layer.addSublayer(bottomLine)
        return textField
    }()
    
    let phoneNumberErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "You must enter a valid phone number!"
        label.textColor = .red
        return label
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( SigningupProperties.continueButton, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor.rgb(red: 0, green: 100, blue: 237)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(goToSetUsernamePage), for: .touchUpInside)
        return button
    }()
    
    lazy var inviteCodeLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.attributedText = NSAttributedString(string: SigningupProperties.inviteCodeLabel , attributes: SigningupProperties.inviteCodeLabelAttributes)
        uiLabel.textAlignment = .center
        return uiLabel
    }()
    
    let agreementLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.textColor = .lightGray
        uiLabel.textAlignment = .center
        uiLabel.attributedText = TextFieldHelpers.this()
        return uiLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        addCustomViews()
        configureCustomView()
        setUpNavigationItems()
        stackView()
        
        emailErrorLabel.isHidden = true
        firstNameErrorLabel.isHidden = true
        lastNameErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        phoneNumberErrorLabel.isHidden = true
    }
    
    private func addCustomViews() {
        view.addSubview(cancelButton)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(emailTextField)
        view.addSubview(emailErrorLabel)
        view.addSubview(passwordTextField)
        view.addSubview(showPasswordButton)
        view.addSubview(passwordErrorLabel)
        view.addSubview(phoneNumberTextField)
        view.addSubview(phoneNumberErrorLabel)
        view.addSubview(firstNameErrorLabel)
        view.addSubview(lastNameErrorLabel)
        view.addSubview(continueButton)
        view.addSubview(inviteCodeLabel)
        view.addSubview(agreementLabel)
        view.addSubview(navBar)
    }
    
    private func stackView() {
        let stackView = UIStackView(arrangedSubviews: [
            firstNameTextField, lastNameTextField
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        _ = stackView.anchor(subtitleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 58, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        _ = firstNameTextField.anchor(nil, left: stackView.rightAnchor, bottom: nil, right: lastNameTextField.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        
        _ = lastNameTextField.anchor(nil, left: firstNameTextField.rightAnchor, bottom: nil, right: stackView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        
        _ = firstNameErrorLabel.anchor(firstNameTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        _ = lastNameErrorLabel.anchor(lastNameTextField.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
    }
    
    private func setUpNavigationItems() {
        self.navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 0)
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationController!.navigationBar.tintColor = .black
    }
    
    @objc func togglePasswordVisibility() {
        if(onClick == true) {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
        onClick = !onClick
    }
    
    @objc func goToSetUsernamePage() {
        guard let email = self.emailTextField.text, let password = self.passwordTextField.text, let firstName = self.firstNameTextField.text, let lastName = self.lastNameTextField.text, let phoneNumber = self.passwordTextField.text  else {
            return
        }
        let isValidFirstName = self.validation.validateFirstName(firstName)
        let isValidLastName = self.validation.validateLastName(lastName)
        let isValidEmail = self.validation.validateEmailAddress(email)
        let isValidPassword = self.validation.validatePassword(password)
        let isValidPhoneNumber = self.phoneNumberTextField.text
        
        if isValidEmail == true && isValidPassword == true && isValidFirstName == true && isValidLastName == true && isValidPhoneNumber != "" {
            //            page to open
            let viewController = SetUsernameViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
            
            emailErrorLabel.isHidden = true
            firstNameErrorLabel.isHidden = true
            lastNameErrorLabel.isHidden = true
            passwordErrorLabel.isHidden = true
            phoneNumberErrorLabel.isHidden = true
        }
        if isValidFirstName == false {
            self.firstNameTextField.placeholder = ""
            self.firstNameTextField.attributedPlaceholder = LoginPageAttributes.emptyPlaceholder
            firstNameErrorLabel.isHidden = false
        }
        
        if isValidLastName == false {
            self.lastNameTextField.placeholder = ""
            self.lastNameTextField.attributedPlaceholder = LoginPageAttributes.emptyPlaceholder
            lastNameErrorLabel.isHidden = false
        }
        
        if isValidEmail == false {
            self.emailTextField.placeholder = ""
            self.emailTextField.attributedPlaceholder = LoginPageAttributes.emptyPlaceholder
            emailErrorLabel.isHidden = false
        }
        
        if  isValidPassword == false   {
            passwordErrorLabel.isHidden = false
            self.passwordTextField.placeholder = ""
        }
        
        if  isValidPhoneNumber == ""   {
            phoneNumberErrorLabel.isHidden = false
            self.phoneNumberTextField.placeholder = ""
            
        }
        if self.emailTextField.text != "" {
            emailErrorLabel.isHidden = true
        }
        if self.passwordTextField.text != "" {
            passwordErrorLabel.isHidden = true
        }
        if self.firstNameTextField.text != "" {
            firstNameErrorLabel.isHidden = true
        }
        if self.lastNameTextField.text != "" {
            lastNameErrorLabel.isHidden = true
        }
        if self.phoneNumberTextField.text != "" {
            phoneNumberErrorLabel.isHidden = true
        }
    }
    
    @objc func goToGuide() {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    private func configureCustomView() {
        view.insetsLayoutMarginsFromSafeArea = false
        _ =  cancelButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 60, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        _ = titleLabel.anchor(cancelButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 50, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = subtitleLabel.anchor(titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = emailTextField.anchor(subtitleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 150, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 50)
        
        _ = emailErrorLabel.anchor(emailTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        _ = passwordTextField.anchor(emailTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 50)
        
        _ = showPasswordButton.anchor(emailTextField.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 0, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 50)
        
        _ = passwordErrorLabel.anchor(passwordTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        _ = phoneNumberTextField.anchor(passwordTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 50, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 50)
        
        _ = phoneNumberErrorLabel.anchor(phoneNumberTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        _ = continueButton.anchor(phoneNumberTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 70, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 60)
        
        _ = inviteCodeLabel.anchor(continueButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 65, leftConstant: 15, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
        
        _ = agreementLabel.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 15, bottomConstant: 25, rightConstant: 15, widthConstant: 0, heightConstant: 0)
    }
}

