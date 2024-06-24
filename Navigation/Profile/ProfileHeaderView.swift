//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by user on 19.06.2024.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Hipster Cat"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 60
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image = UIImage(named: "cat")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let profileStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let showStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.setTitle("Show status", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let statusTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "write your status"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var statusText: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        backgroundColor = .white
        showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        addSubview(profileImageView)
        addSubview(profileNameLabel)
        addSubview(profileStatusLabel)
        addSubview(showStatusButton)
        addSubview(statusTextField)
        statusTextField.addTarget(self, action: #selector(statusTextChanged(_ :)), for: .editingChanged)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: 120),
            profileImageView.heightAnchor.constraint(equalToConstant: 120),
            
            profileNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            profileNameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 16),
            profileNameLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            profileNameLabel.heightAnchor.constraint(equalToConstant: 24),
            
            profileStatusLabel.leftAnchor.constraint(equalTo: profileNameLabel.leftAnchor),
            profileStatusLabel.rightAnchor.constraint(equalTo: profileNameLabel.rightAnchor),
            profileStatusLabel.heightAnchor.constraint(equalToConstant: 24),
            profileStatusLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 8),
            
            showStatusButton.leftAnchor.constraint(equalTo: profileImageView.leftAnchor),
            showStatusButton.rightAnchor.constraint(equalTo: profileNameLabel.rightAnchor),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
            showStatusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            
            statusTextField.leftAnchor.constraint(equalTo: profileStatusLabel.leftAnchor),
            statusTextField.rightAnchor.constraint(equalTo: profileStatusLabel.rightAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.topAnchor.constraint(equalTo: profileStatusLabel.bottomAnchor, constant: 8)
            
        ])
    }
            
    @objc func buttonPressed() {
        profileStatusLabel.text = statusText
        statusTextField.text = ""
        endEditing(true)
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
}
