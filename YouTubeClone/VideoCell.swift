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
        imageView.backgroundColor = .blue
        return imageView
    }()

    let separator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()

    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .green
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .purple
        return label
    }()

    let descriptionText: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .red
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
        addConstraint(NSLayoutConstraint(item: descriptionText, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
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

