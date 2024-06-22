//
//  LogInViewController.swift
//  Navigation
//
//  Created by user on 22.06.2024.
//

import UIKit

class LogInViewController: UIViewController {
    
    let contentScrollView = UIScrollView()
    
    let iconImageView = UIImageView()
    let emailTextField = NiceTextField()
    let passwordTextField = NiceTextField()
    let logInButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(willShowKeyboard(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willHideKeyboard(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
    }
    
    func setupUI() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        view.addSubview(contentScrollView)
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        contentScrollView.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = UIImage(named: "logo")
        
        contentScrollView.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.layer.cornerRadius = 10.0
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.backgroundColor = .systemGray6
        emailTextField.autocapitalizationType = .none
        emailTextField.font = .systemFont(ofSize: 16, weight: .regular)
        emailTextField.textColor = .black
        emailTextField.placeholder = "Email or phone"
        
        contentScrollView.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.layer.cornerRadius = 10.0
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.autocapitalizationType = .none
        passwordTextField.font = .systemFont(ofSize: 16, weight: .regular)
        passwordTextField.textColor = .black
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Password"
        
        
        contentScrollView.addSubview(logInButton)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setTitle("Log in", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.setBackgroundImage(.bluePixel, for: .normal)
        logInButton.layer.cornerRadius = 10.0
        logInButton.clipsToBounds = true
        logInButton.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            contentScrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            contentScrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 100),
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.centerXAnchor.constraint(equalTo: contentScrollView.centerXAnchor),
            iconImageView.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: 120),
            
            emailTextField.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 120),
            emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.leftAnchor.constraint(equalTo: emailTextField.leftAnchor),
            passwordTextField.rightAnchor.constraint(equalTo: emailTextField.rightAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            
            logInButton.leftAnchor.constraint(equalTo: emailTextField.leftAnchor),
            logInButton.rightAnchor.constraint(equalTo: emailTextField.rightAnchor),
            logInButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor, constant: -8)
        ])
        
    }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        
        let yOffset = contentScrollView.contentSize.height + (keyboardHeight ?? 0) - view.frame.height
        contentScrollView.contentOffset.y = yOffset
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
