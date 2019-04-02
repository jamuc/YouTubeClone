//
//  VideoCell.swift
//  YouTubeClone
//
//  Created by Jason Franklin on 01.04.19.
//  Copyright © 2019 Jason Franklin. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {

    static let videoCellID = "videoCell"

    let thumbNail: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    let separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()

    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "taylor_swift_profile")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Taylor Swift - Blank Space"
        return label
    }()

    let descriptionText: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Many people have viewed this video. It is really good."
        textView.contentInset = UIEdgeInsets(top: -4, left: -4, bottom: 0, right: 0)
        textView.textColor = UIColor.lightGray
        return textView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        addSubview(thumbNail)
        addSubview(separator)
        addSubview(profileImage)
        addSubview(titleLabel)
        addSubview(descriptionText)

        addConstraints(withFormat: "H:|-16-[v0]-16-|", forSubviews: thumbNail)
        addConstraints(withFormat: "H:|[v0]|", forSubviews: separator)
        addConstraints(withFormat: "H:|-16-[v0(44)]", forSubviews: profileImage)

        addConstraints(withFormat: "V:|-16-[v0]-8-[v1(44)]-8-[v2(1)]|", forSubviews: thumbNail, profileImage, separator)

        // Title label layout
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbNail, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: profileImage, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbNail, attribute: .right, multiplier: 1, constant: 0))
        addConstraints(withFormat: "V:[v0(20)]", forSubviews: titleLabel)

        // Description view layout
        addConstraint(NSLayoutConstraint(item: descriptionText, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: descriptionText, attribute: .left, relatedBy: .equal, toItem: profileImage, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: descriptionText, attribute: .right, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 0))
        addConstraints(withFormat: "V:[v0(20)]", forSubviews: descriptionText)
    }
}

extension UIView {
    func addConstraints(withFormat format: String, forSubviews subviews: UIView...) {
        var viewDictionary = [String: UIView]()

        for (index, view) in subviews.enumerated() {
            let key = "v\(index)"
            viewDictionary[key] = view
        }

         addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary))
    }
}

