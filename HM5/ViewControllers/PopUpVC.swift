//
//  PopUpVC.swift
//  HM5
//
//  Created by Daniel on 03.12.2022.
//

import UIKit
import Photos
import PhotosUI

class PopUpVC: UIViewController {
    
     var delegate: BirthdayVCDelegate?
    
    //MARK: DONEBUTTON
    private let DoneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(dismissSheet), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let profileImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "person")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let changeImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change Image", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(changeImage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: Name label && textfield
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = UIColor.blue
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .default
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //MARK: Date label && textfield
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date of birth"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Pick date"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .default
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //MARK: Age label && textfield && picker
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let agePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Pick your age"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .default
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //MARK: Sex label && textfield && picker
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.text = "Genre"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let genreTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Pick genre"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .default
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let genrePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    //MARK: Instagram label && textfield
    private let instagramLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let instagramTextField: UITextField = {
       let textField = UITextField()
       textField.placeholder = "Pick genre"
       textField.font = UIFont.systemFont(ofSize: 15)
       textField.borderStyle = .roundedRect
       textField.autocorrectionType = .default
       textField.keyboardType = .default
       textField.returnKeyType = .done
       textField.clearButtonMode = .whileEditing
        textField.addTarget(self, action: #selector(didRecogniseTapGesture), for: UIControl.Event.editingDidBegin)
       textField.translatesAutoresizingMaskIntoConstraints = false
       return textField
   }()
    
    //MARK: Face ID label && switch
    
    
    let genre = ["Male", "Female", "Unknown"]
    let age = Array(1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        agePicker.tag = 0
        genrePicker.tag = 1
        view.addSubview(profileImageView)
        view.addSubview(changeImageButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(dateLabel)
        view.addSubview(dateTextField)
         dateTextField.datePicker(target: self, doneAction: #selector(doneAction), cancelAction: #selector(cancelAction))
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        ageTextField.inputView = agePicker
        
        // picker
        agePicker.dataSource = self
        agePicker.delegate = self
        
        // genre label && textfield
        view.addSubview(genreLabel)
        view.addSubview(genreTextField)
        genreTextField.inputView = genrePicker
        
        //
        genrePicker.delegate = self
        genrePicker.dataSource = self
        
        // instagram label && textfield
        view.addSubview(instagramLabel)
        view.addSubview(instagramTextField)
        view.addSubview(DoneButton)
        
        applyConstraints()
        view.backgroundColor = .white        
    }
    
   //MARK: dateTextfield methods
    @objc func cancelAction() {
        self.dateTextField.resignFirstResponder()
    }
    
    @objc func doneAction() {
        if let datePicker = self.dateTextField.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateString = dateFormatter.string(from: datePicker.date)
            self.dateTextField.text = dateString
        }
        
        self.dateTextField.resignFirstResponder()
    }
    
    //MARK: Instagram textfield
    @objc func didRecogniseTapGesture() {
         showInstagramAlert()
    }
    
    @objc func dismissSheet() {
        dismiss(animated: true, completion: nil)
        delegate?.update(name: nameTextField.text!, age: ageTextField.text!, time: Date())
    }

    @objc func changeImage() {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 1
        config.filter = PHPickerFilter.images
        let vc = PHPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
    }
        
    
    func showInstagramAlert() {
        
        let alertController = UIAlertController(title: "Instagram nikname", message: "Enter your instagram nikname", preferredStyle: .alert)
        
        alertController.addTextField { word in
            word.placeholder = "Your nickName"
        }
        
        let ok = UIAlertAction(title: "Ok", style: .cancel) { action in
            let text = alertController.textFields?.first
            
            self.instagramTextField.text! = (text?.text!)!
        }
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    private func applyConstraints() {
        
        let DoneButtonConstrains = [
            DoneButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            DoneButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        ]
        
        let personImageConstrains = [
         profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
         profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//         profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
//         profileImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
         profileImageView.widthAnchor.constraint(equalToConstant: 80),
         profileImageView.heightAnchor.constraint(equalToConstant: 90)
        ]
        
        let changeImageButtonConstrains = [
            changeImageButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            //changeImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120)
            changeImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]

        let nameLabelConstrains = [
          nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
          nameLabel.topAnchor.constraint(equalTo: changeImageButton.bottomAnchor, constant: 30),
        ]

        let nameTextFieldConstrains = [
          nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
          nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
          nameTextField.widthAnchor.constraint(equalToConstant: 300)
        ]
        
        let dateLabelConstrains = [
           dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           dateLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15)
        ]

        let dateTextfieldConstrains = [
            dateTextField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 15),
           dateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           dateTextField.widthAnchor.constraint(equalToConstant: 300)
        ]
        
        let ageLabelConstrains = [
          ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
          ageLabel.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 15)
        ]
        
        let agePickerConstrains = [
           ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 15),
           ageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           ageTextField.widthAnchor.constraint(equalToConstant: 300)
        ]
        
        let genreLabelConstrains = [
          genreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
          genreLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 15)
        ]
    
        let gennreTextFieldConstrains = [
         genreTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
         genreTextField.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 15),
         genreTextField.widthAnchor.constraint(equalToConstant: 300)
        ]

        let instagramLabelConstrains = [
        instagramLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        instagramLabel.topAnchor.constraint(equalTo: genreTextField.bottomAnchor, constant: 15)
        ]
        
        let instagramTextFieldConstrains = [
        instagramTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        instagramTextField.topAnchor.constraint(equalTo: instagramLabel.bottomAnchor, constant: 15),
        instagramTextField.widthAnchor.constraint(equalToConstant: 300)
        ]
        
        NSLayoutConstraint.activate(DoneButtonConstrains)
        NSLayoutConstraint.activate(nameLabelConstrains)
        NSLayoutConstraint.activate(nameTextFieldConstrains)
        NSLayoutConstraint.activate(personImageConstrains)
        NSLayoutConstraint.activate(changeImageButtonConstrains)
        NSLayoutConstraint.activate(dateLabelConstrains)
        NSLayoutConstraint.activate(dateTextfieldConstrains)
        NSLayoutConstraint.activate(ageLabelConstrains)
        NSLayoutConstraint.activate(agePickerConstrains)
        NSLayoutConstraint.activate(genreLabelConstrains)
        NSLayoutConstraint.activate(gennreTextFieldConstrains)
        NSLayoutConstraint.activate(instagramLabelConstrains)
        NSLayoutConstraint.activate(instagramTextFieldConstrains)
    }

}

extension PopUpVC: PHPickerViewControllerDelegate {
    
func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
    results.forEach { results in
        results.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] reading, error in
            DispatchQueue.main.sync {
                guard let image = reading as? UIImage, error == nil else { return }
                self?.profileImageView.image = image
                picker.dismiss(animated: true, completion: nil)
            }
        }
    }
  }
}

