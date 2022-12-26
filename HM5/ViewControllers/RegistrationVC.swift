//
//  RegistrationVC.swift
//  HM5
//
//  Created by Daniel on 02.12.2022.
//

import UIKit

class RegistrationVC: UIViewController {

    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(getToBirthdayVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let birthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday reminder"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.textColor = UIColor.purple
        label.textAlignment = .center
        label.layer.borderWidth = 5
        label.layer.borderColor = UIColor.purple.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let faceIDLabel: UILabel = {
        let label = UILabel()
        label.text = "Face ID"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let faceIDSwitch: UISwitch = {
        let faceIDSwitch = UISwitch(frame: CGRect(x: 290, y: 535, width: 0, height: 0))
        faceIDSwitch.onTintColor = .red
        return faceIDSwitch
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .default
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .default
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple

        view.addSubview(signUpButton)
        view.addSubview(birthdayLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(faceIDLabel)
        view.addSubview(faceIDSwitch)
        applyConstraints()
    }
    
    private func applyConstraints() {
        let birthdayLabelConstrains = [
            birthdayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            birthdayLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            birthdayLabel.widthAnchor.constraint(equalToConstant: 300),
            birthdayLabel.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        let signInLabelConstrains = [
            signInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            signInLabel.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 70)
        ]
        
        let emailLabelConstrains = [
           emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
           emailLabel.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 20)
        ]
        
        let emailTextFieldConstrains = [
           emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
           emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
           emailTextField.widthAnchor.constraint(equalToConstant: 300)
        ]
        
        let passwordLabelConstrains = [
          passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
          passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20)
        ]
        
        let passwordTextFieldConstrains = [
          passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
          passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 20),
          passwordTextField.widthAnchor.constraint(equalToConstant: 300)
        ]
        
        let faceIDLabelConstrains = [
            faceIDLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200),
            faceIDLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50)
        ]
        
        let signUpButtonConstrains = [
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            signUpButton.widthAnchor.constraint(equalToConstant: 300),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(birthdayLabelConstrains)
        NSLayoutConstraint.activate(signUpButtonConstrains)
        NSLayoutConstraint.activate(signInLabelConstrains)
        NSLayoutConstraint.activate(emailLabelConstrains)
        NSLayoutConstraint.activate(emailTextFieldConstrains)
        NSLayoutConstraint.activate(passwordLabelConstrains)
        NSLayoutConstraint.activate(passwordTextFieldConstrains)
        NSLayoutConstraint.activate(faceIDLabelConstrains)
    }
    
    @objc func getToBirthdayVC() {
        let birthdayVC = BirthdayVC()
        self.navigationController?.pushViewController(birthdayVC, animated: true)
    }
    
}
