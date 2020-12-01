//
//  ProfilePageViewController.swift
//  CowryWise Login Guide
//
//  Created by mac on 01/10/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController, ProfileResponseProtocol {
    var navBar: UINavigationBar = UINavigationBar()
    var profileData: ProfileResponseModel?
    var tableData: [ProfilePageDataModel] = [ProfilePageDataModel]()
    
    let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl (items: [ProfilePageProperties.segmentedControl1, ProfilePageProperties.segmentedControl2, ProfilePageProperties.segmentedControl3])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(handleSementChange), for: .valueChanged)
        return segmentedControl
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ProfilePageProperties.userImage)
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let imageChangerLabel: UILabel = {
        let label = UILabel()
        label.attributedText = ProfilePageViewController.profileImageChangerLabel()
        return label
        
    }()
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let profileRequest = ProfileResponseDataLoader()
        profileRequest.profileResponseDelegate = self
        profileRequest.getData()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        loadProfileData()
        setUpNavigationItems()
        createStackView()
        
        tableView.register(ProfilePageCell.self, forCellReuseIdentifier: ProfilePageProperties.cellId)
        self.navigationController?.isNavigationBarHidden = false
        
        
        
        let backbutton = UIButton(type: .custom)
        let image = UIImage(named: GlobalVariables.profileBackButton)
        backbutton.setImage(image, for: .normal)
        backbutton.tintColor = .black
        backbutton.setTitle(ProfilePageProperties.backButtonTitle, for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal)
        backbutton.addTarget(self, action: #selector(handleBackAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
    }
    
    func getProfileData(data: ProfileResponseModel) {
        DispatchQueue.main.async {
            self.loadProfileData()
            self.profileData = data
            self.tableView.reloadData()
        }
    }
    
    func loadProfileData() {
        let queue = DispatchQueue(label: "")
        queue.async{
            DispatchQueue.main.async {
                if let data =  self.profileData {
                    self.tableData.append(ProfilePageDataModel(leftLabel: "", rightLabel: ""))
                    self.tableData.append(ProfilePageDataModel(leftLabel: ProfileLabel.firstNameLabel, rightLabel: data.firstName))
                    self.tableData.append(ProfilePageDataModel(leftLabel: ProfileLabel.lastNameLabel, rightLabel: data.lastName))
                    self.tableData.append(ProfilePageDataModel(leftLabel: ProfileLabel.userNameLabel, rightLabel: data.username))
                    self.tableData.append(ProfilePageDataModel(leftLabel: ProfileLabel.genderLabel, rightLabel: String(data.gender)))
                    self.tableData.append(ProfilePageDataModel(leftLabel: ProfileLabel.dateOfBirthLabel, rightLabel: String(data.dateOfBirth.prefix(10))))
                    self.tableData.append(ProfilePageDataModel(leftLabel: ProfileLabel.nextOfKinLabel, rightLabel: data.nextOfKin))
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    static func profileImageChangerLabel() -> NSAttributedString {
        let imageLabelAttribute =  NSMutableAttributedString(string: ProfilePageProperties.imageLabel, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular),
            NSAttributedString.Key.foregroundColor: UIColor.lightGray
        ])
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let length = imageLabelAttribute.string.count
        imageLabelAttribute.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
        return imageLabelAttribute
    }
    
    @objc func handleSementChange() {
        
    }
    
    @objc func handleBackAction() {
        let viewController = LoginViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    private func createStackView() {
        let stackView = UIStackView(arrangedSubviews: [
            segmentedControl, imageView, imageChangerLabel, tableView
        ])
        stackView.axis = .vertical
        stackView.distribution = .fill
        view.addSubview(stackView)
        
        stackView.anchorWithConstantsToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 20)
        
        _ = segmentedControl.anchor(view.topAnchor, left: stackView.leftAnchor, bottom: nil, right: stackView.rightAnchor, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
        
        _ = imageView.anchor(segmentedControl.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 200, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 200)
        
        _ = imageChangerLabel.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 180, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        _ = tableView.anchor(imageChangerLabel.bottomAnchor, left: stackView.leftAnchor, bottom: stackView.bottomAnchor, right: stackView.rightAnchor, topConstant: 300, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    private func addViews() {
        view.addSubview(navBar)
    }
    
    private func setUpNavigationItems() {
        self.navBar.frame = CGRect(x: 0, y: 0, width: 320, height: 0)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = .white
        navigationItem.title = ProfilePageProperties.navigationItemTitle
        self.navigationController!.navigationBar.titleTextAttributes =  [.foregroundColor: UIColor.black]
        self.navigationController!.navigationBar.tintColor = .black
    }
}

extension ProfilePageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfilePageProperties.cellId, for: indexPath) as! ProfilePageCell
        let item = tableData[indexPath.row]
        cell.profilePageData = item
        return cell
    }
    
}
