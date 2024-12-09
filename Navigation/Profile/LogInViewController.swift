//
//  LogInViewController.swift
//  Navigation
//
//  Created by user on 22.06.2024.
//

import UIKit

class LogInViewController: UIViewController {
    
    let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 10.0
        return stackView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.autocapitalizationType = .none
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .black
        textField.placeholder = "Email or phone"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.autocapitalizationType = .none
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .black
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(.bluePixel, for: .normal)
        button.layer.cornerRadius = 10.0
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    func setupUI() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        view.addSubview(contentScrollView)
        textFieldsStackView.addArrangedSubview(emailTextField)
        textFieldsStackView.addArrangedSubview(separatorView)
        textFieldsStackView.addArrangedSubview(passwordTextField)
        
        contentScrollView.addSubview(iconImageView)
        contentScrollView.addSubview(textFieldsStackView)
        contentScrollView.addSubview(logInButton)
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            contentScrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            contentScrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 100),
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.centerXAnchor.constraint(equalTo: contentScrollView.centerXAnchor),
            iconImageView.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: 120),
            
            textFieldsStackView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 120),
            textFieldsStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            textFieldsStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            textFieldsStackView.heightAnchor.constraint(equalToConstant: 100.5),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
    
            logInButton.leftAnchor.constraint(equalTo: textFieldsStackView.leftAnchor),
            logInButton.rightAnchor.constraint(equalTo: textFieldsStackView.rightAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: 16),
            logInButton.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor, constant: -8)
        ])
    }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        
        let yOffset = contentScrollView.contentSize.height + (keyboardHeight ?? 0) - view.frame.height
        contentScrollView.contentOffset.y = yOffset > 0 ? yOffset : contentScrollView.contentOffset.y
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        contentScrollView.contentOffset.y = 0
    }
    
    @objc func logInButtonTapped() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
