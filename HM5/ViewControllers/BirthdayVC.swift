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
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let photo: UIImageView = {
        let foto = UIImageView()
        foto.image = UIImage(named: "person.circle.fill")
        foto.tintColor = .systemGray
        return foto
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

        if let sheeet = popUpVc.sheetPresentationController {
            sheeet.detents = [.large()]
        }
        popUpVc.delegate = self
        present(popUpVc, animated: true, completion: nil)
    }
    
    func update(name: String, age: String, time: Date) {
        nameLabel.text = name.capitalized
        ageLabel.text = age + " years"
        self.view.addSubview(photo)
    }
    
    func applyConstraints() {
        
        NSLayoutConstraint.activate([
        
            photo.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            photo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            photo.widthAnchor.constraint(equalToConstant: 71),
            photo.heightAnchor.constraint(equalToConstant: 71),
            
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            nameLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            ageLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            ageLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
