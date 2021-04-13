//
//  ProfileInfoHedaerCollectionReusableView.swift
//  Instagram
//
//  Created by Jay Lee on 2021/04/12.
//

import UIKit

protocol ProfileInfoHedaerCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostsButton(_ header: ProfileInfoHedaerCollectionReusableView)
    func profileHeaderDidTapFollowersButton(_ header: ProfileInfoHedaerCollectionReusableView)
    func profileHeaderDidTapFollowingButton(_ header: ProfileInfoHedaerCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header: ProfileInfoHedaerCollectionReusableView)
}

final class ProfileInfoHedaerCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate: ProfileInfoHedaerCollectionReusableViewDelegate?
    
    private let profilePhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let postsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Posts", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemGray
        return button
    }()
    
    private let followerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemGray
        return button
    }()
        
    private let followingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemGray
        return button
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemGray
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jay Lee"
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the first account!"
        label.textColor = .label
        label.numberOfLines = 0 // line wrap
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addButtonActions()

        backgroundColor = .systemBlue
        clipsToBounds = true
    }
    
    private func addSubviews() {
        addSubview(profilePhotoImageView)
        addSubview(postsButton)
        addSubview(followerButton)
        addSubview(followingButton)
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
        addSubview(followerButton)
    }
    
    private func addButtonActions() {
        followerButton.addTarget(self, action: #selector(didTapFollowerButton), for: .touchUpInside)
        followingButton.addTarget(self, action: #selector(didTapFollowingButton), for: .touchUpInside)
        postsButton.addTarget(self, action: #selector(didTapPostsButton), for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width/4
        profilePhotoImageView.frame = CGRect(x: 5,
                                             y: 5,
                                             width: profilePhotoSize,
                                             height: profilePhotoSize).integral
        
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2.0
        
        let buttonHeight = profilePhotoSize/2
        let countButtonWidth = (width-10-profilePhotoSize)/3
        
        postsButton.frame = CGRect(x: profilePhotoImageView.right,
                                   y: 5,
                                   width: countButtonWidth,
                                   height: buttonHeight)
        
        followerButton.frame = CGRect(x: postsButton.right,
                                      y: 5,
                                      width: countButtonWidth,
                                      height: buttonHeight)
        
        followingButton.frame = CGRect(x: followerButton.right,
                                       y: 5,
                                       width: countButtonWidth,
                                       height: buttonHeight)
        
        editProfileButton.frame = CGRect(x: profilePhotoImageView.right,
                                         y: 5 + buttonHeight,
                                         width: countButtonWidth*3,
                                         height: buttonHeight).integral
        
        nameLabel.frame = CGRect(x: 5,
                                 y: 5 + profilePhotoImageView.bottom,
                                 width: width-10,
                                 height: 50).integral
        
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        bioLabel.frame = CGRect(x: 5,
                                 y: nameLabel.bottom,
                                 width: width-10,
                                 height: bioLabelSize.height).integral
    }
    
    @objc private func didTapFollowerButton() {
        delegate?.profileHeaderDidTapFollowersButton(self)
    }
    
    @objc private func didTapFollowingButton() {
        delegate?.profileHeaderDidTapFollowingButton(self)
    }
    
    @objc private func didTapPostsButton() {
        delegate?.profileHeaderDidTapPostsButton(self)
    }
    
    @objc private func didTapEditProfileButton() {
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
}
