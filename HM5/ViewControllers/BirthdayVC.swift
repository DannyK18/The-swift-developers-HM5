//
//  BirthdayVC.swift
//  HM5
//
//  Created by Daniel on 02.12.2022.
//

import UIKit

protocol BirthdayVCDelegate: AnyObject {
    func update(name: String, age: String, time: Date)
}

class BirthdayVC: UIViewController, BirthdayVCDelegate {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        navigationItem.title = "Birthday"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addProfile))
        [nameLabel, ageLabel].forEach { subview in
            view.addSubview(subview)
        
        }
        applyConstraints()
    }
    
    @objc func addProfile() {
        let popUpVc = PopUpVC()

        popUpVc.delegate = self
        if let sheeet = popUpVc.sheetPresentationController {
            sheeet.detents = [.large()]
        }
        present(popUpVc, animated: true, completion: nil)
    }
    
    func update(name: String, age: String, time: Date) {
        nameLabel.text? = name.capitalized
        ageLabel.text? += age + " years"
    }
    
    func applyConstraints() {
        
        NSLayoutConstraint.activate([
        
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            ageLabel.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            ageLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
