//
//  ViewController.swift
//  CowryWise Login Guide
//
//  Created by mac on 28/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * (4/5)), collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    lazy var buttonView: UIView = {
        let buttonView = UIView(frame: CGRect(x:0 , y: view.frame.height * (4/5), width: view.frame.width, height: view.frame.width * (2/5)))
        return buttonView
    }()
    lazy var signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(LandingPageButtons.signupTitle, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor.rgb(red: 0, green: 100, blue: 237)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleSingupButtonClick), for: .touchUpInside)
        return button
    }()
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(LandingPageButtons.loginTitle, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .white
        button.setTitleColor(UIColor.rgb(red: 0, green: 100, blue: 237), for: .normal)
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleLoginButtonClick), for: .touchUpInside)
        return button
    }()
    let pages: [LandingPageCellModel] = {
        let page1 = LandingPageCellModel(imageName: LandingPageVariables.imageName1, title: LandingPageVariables.title1, message: LandingPageVariables.message1)
        let page2 = LandingPageCellModel(imageName: LandingPageVariables.imageName2, title: LandingPageVariables.title2, message: LandingPageVariables.message2)
        let page3 = LandingPageCellModel(imageName: LandingPageVariables.imageName3, title: LandingPageVariables.title3, message: LandingPageVariables.message3)
        let page4 = LandingPageCellModel(imageName: LandingPageVariables.imageName4, title: LandingPageVariables.title4, message: LandingPageVariables.message4)
        return [page1, page2, page3, page4]
    }()
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = UIColor.rgb(red: 0, green: 100, blue: 237)
        pc.numberOfPages = self.pages.count
        return pc
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        view.backgroundColor = .white
        customConstraints()
        registerCells()
        self.navigationController?.isNavigationBarHidden = true
    }
    func addViews() {
        view.addSubview(collectionView)
        view.addSubview(buttonView)
        view.addSubview(pageControl)
        buttonView.addSubview(signupButton)
        buttonView.addSubview(loginButton)
    }
    @objc func handleSingupButtonClick() {
        let viewController = SigningupWithDetailsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    @objc func handleLoginButtonClick() {
        let viewController = LoginViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func customConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor),
            //             button views
            buttonView.topAnchor.constraint(equalTo: collectionView.topAnchor),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            buttonView.widthAnchor.constraint(equalTo: view.widthAnchor),
            buttonView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        _ = signupButton.anchor(buttonView.topAnchor,
            left: buttonView.leftAnchor,
            bottom: nil,
            right: buttonView.rightAnchor,
            topConstant: 10, leftConstant: 15,
            bottomConstant: 0, rightConstant: 15,
            widthConstant: 0, heightConstant: 50)
        _ = loginButton.anchor(signupButton.bottomAnchor,
            left: buttonView.leftAnchor, bottom: nil,
            right: buttonView.rightAnchor, topConstant: 10,
            leftConstant: 15, bottomConstant: 0, rightConstant: 15,
            widthConstant: 0, heightConstant: 50)
        _ = pageControl.anchor(nil, left: collectionView.leftAnchor,
            bottom: collectionView.bottomAnchor,
            right: collectionView.rightAnchor,
            topConstant: 0, leftConstant: 0, bottomConstant: 0,
            rightConstant: 0, widthConstant: 0, heightConstant: 40)[2]
    }
    func registerCells() {
        collectionView.register(LandingPageCellView.self, forCellWithReuseIdentifier: RegisteredCells.cellId)
    }
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
    }
}
