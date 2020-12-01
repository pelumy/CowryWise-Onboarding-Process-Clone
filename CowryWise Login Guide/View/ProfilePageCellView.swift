//
//  File.swift
//  CowryWise Login Guide
//
//  Created by mac on 01/10/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

class ProfilePageCell: UITableViewCell {
    var profilePageData: ProfilePageDataModel?  {
        didSet {
            leftLabel.text = profilePageData?.leftLabel
            rightLabel.text = profilePageData?.rightLabel
        }
    }
    
    let leftLabel: UILabel = {
        let label = UILabel()
        label.text = ProfileLabel.firstNameLabel
        return label
    }()
    
    let rightLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .lightGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(leftLabel)
        addSubview(rightLabel)
        
        _ = leftLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 25, leftConstant: 25, bottomConstant: 25, rightConstant:0, widthConstant: 0, heightConstant: 0)
        
        _ = rightLabel.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 25, leftConstant: 0, bottomConstant: 25, rightConstant: 25, widthConstant: 0, heightConstant: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
