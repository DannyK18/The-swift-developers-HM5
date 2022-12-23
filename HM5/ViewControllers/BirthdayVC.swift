//
//  BirthdayVC.swift
//  HM5
//
//  Created by Daniel on 02.12.2022.
//

import UIKit

protocol BirthdayVCDelegate: AnyObject {
    func update(name: String, age: String, time: Date, image: UIImage)
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
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let photo: UIImageView = {
        let foto = UIImageView(frame: .zero)
//        foto.image = UIImage(named: "person.circle.fill")
        foto.tintColor = .systemGray
        foto.translatesAutoresizingMaskIntoConstraints = false
        return foto
    }()
    
    private let dateFormatter: String = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, h:mm a"
    dateFormatter.timeZone = .current
      return dateFormatter.string(from: Date())
}()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        navigationItem.title = "Birthday"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addProfile))
        [nameLabel, ageLabel, photo, dateLabel].forEach { subview in
            view.addSubview(subview)
        }
        [dateLabel, photo].forEach {
            $0.isHidden = true
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
    
    func update(name: String, age: String, time: Date, image: UIImage) {
        nameLabel.text = name.capitalized
        ageLabel.text = age + " years"
        dateLabel.text = dateFormatter
        photo.image = image
        [dateLabel, photo].forEach {
            $0.isHidden = false
        }
    }
    
    func applyConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        
            photo.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50),
            photo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            photo.widthAnchor.constraint(equalToConstant: 71),
            photo.heightAnchor.constraint(equalToConstant: 71),
            
            nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: 300),

            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            ageLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            ageLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 40),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            dateLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
