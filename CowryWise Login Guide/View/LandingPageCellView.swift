//
//  PageCell.swift
//  CowryWise Login Guide
//
//  Created by mac on 28/09/2020.
//  Copyright © 2020 chavicodes. All rights reserved.
//

import UIKit

class LandingPageCellView: UICollectionViewCell {
    var collectionViewPage: LandingPageCellModel? {
        
        didSet {
            guard let page = collectionViewPage else { return }
            
            let imageName = page.imageName
            imageView.image = UIImage(named: imageName)
            
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.semibold),
                NSAttributedString.Key.foregroundColor: GlobalVariables.titleColor
            ])
            
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular),
                NSAttributedString.Key.foregroundColor: GlobalVariables.subtitleColor
            ]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            textView.attributedText = attributedText
        }
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.isEditable = false
        textView.contentInset = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.clipsToBounds = true
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        pageCellConstraints()
    }
    
    func setUpViews() {
        addSubview(imageView)
        addSubview(textView)
    }
    
    func pageCellConstraints() {
        NSLayoutConstraint.activate([
            //            image view
            imageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 70),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5,  constant: -100),
            //            text view
            textView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            textView.widthAnchor.constraint(equalTo: widthAnchor),
            textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5,  constant: 100),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
