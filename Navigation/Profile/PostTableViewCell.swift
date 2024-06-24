//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by user on 23.06.2024.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let postTitleLabel = UILabel()
    let postImageView = UIImageView()
    let postDescriptionLabel = UILabel()
    let postLikesLabel = UILabel()
    let postViewsLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(contentView)
        
        contentView.addSubview(postTitleLabel)
        postTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        postTitleLabel.font = .boldSystemFont(ofSize: 20)
        postTitleLabel.textColor = .black
        postTitleLabel.numberOfLines = 0
        
        contentView.addSubview(postImageView)
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.contentMode = .scaleAspectFit
        postImageView.backgroundColor = .black
        
        contentView.addSubview(postDescriptionLabel)
        postDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        postDescriptionLabel.font = .systemFont(ofSize: 14, weight: .light)
        postDescriptionLabel.textColor = .gray
        postDescriptionLabel.numberOfLines = 0
        
        contentView.addSubview(postLikesLabel)
        postLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        postLikesLabel.font = .systemFont(ofSize: 16, weight: .regular)
        postLikesLabel.numberOfLines = 1
        postLikesLabel.textColor = .black
        
        
        contentView.addSubview(postViewsLabel)
        postViewsLabel.translatesAutoresizingMaskIntoConstraints = false
        postViewsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        postViewsLabel.numberOfLines = 1
        postViewsLabel.textColor = .black
        postViewsLabel.textAlignment = .right
        
        NSLayoutConstraint.activate([
            postTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            postTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            postTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            postTitleLabel.bottomAnchor.constraint(equalTo: postImageView.topAnchor, constant: -8),
            
            postImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            postImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            
            postDescriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8),
            postDescriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            postDescriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            postDescriptionLabel.bottomAnchor.constraint(equalTo: postLikesLabel.topAnchor, constant: -8),
            
            postLikesLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            postLikesLabel.rightAnchor.constraint(equalTo: contentView.centerXAnchor),
            postLikesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            postViewsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            postViewsLabel.leftAnchor.constraint(equalTo: contentView.centerXAnchor),
            postViewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(with post: Post) {
        postTitleLabel.text = post.author
        postLikesLabel.text = "Likes: \(post.likes)"
        postViewsLabel.text = "Views: \(post.views)"
        postDescriptionLabel.text = post.description
        postImageView.image = UIImage(named: post.image)
    }
}
