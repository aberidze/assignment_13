//
//  AddNewItemToListViewController.swift
//  Assignment_13
//
//  Created by Macbook Air 13 on 08.11.23.
//

import UIKit

class AddNewItemToListViewController: UIViewController {
    
    // MARK: - Properties
    var delegate: Delegate?
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        
        return stackView
    }()
    
    private let artistTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Artist"
        
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = UIColor.systemGray6
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private let songTitleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Song Title"
        
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 16
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = UIColor.systemGray6
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private let imagePickerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.backgroundColor = .systemGray6
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 16
        
        return stackView
    }()
    
    private let chosenImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        
        return imageView
    }()
    
    private let chooseImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Choose", for: .normal)
        button.setTitleColor(.red, for: .normal)
        
        return button
    }()
    
    private let addSongButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Song", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .white
        setupBarTitle()
        setupMainStackView()
        addButtonActions()
    }
    
    private func setupBarTitle() {
        self.navigationItem.title = "Add Song"
    }
    
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        setMainStackViewConstraints()
        setMainStackViewMargins()
        fillMainStackView()
    }
    
    private func fillMainStackView() {
        mainStackView.addArrangedSubview(artistTextField)
        mainStackView.addArrangedSubview(songTitleTextField)
        setupImagePickerStackView()
        mainStackView.setCustomSpacing(50, after: imagePickerStackView)
        mainStackView.addArrangedSubview(addSongButton)
        setaddSongButtonConstraints()
    }
    
    private func setupImagePickerStackView() {
        mainStackView.addArrangedSubview(imagePickerStackView)
        setImagePickerStackViewConstraints()
        setImagePickerStackViewMargins()
        imagePickerStackView.addArrangedSubview(chosenImageView)
        imagePickerStackView.addArrangedSubview(chooseImageButton)
        setChooseImageButtonConstraints()
    }
    
    private func addButtonActions() {
        addChosenImageButtonAction()
        addSongButtonAction()
    }
    
    private func addChosenImageButtonAction() {
        chooseImageButton.addAction(UIAction(handler: { [weak self] _ in
            self?.pickAnImage()
            
        }), for: .touchUpInside)
    }
    
    private func pickAnImage() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true)
    }
        
    private func addSongButtonAction() {
        addSongButton.addAction(UIAction(handler: { [weak self] _ in
            let artist = self?.artistTextField.text
            let songTitle = self?.songTitleTextField.text
            let chosenImage = self?.chosenImageView.image
            
            if artist != "" && songTitle != "" && chosenImage != UIImage(systemName: "photo") {
                
                self?.delegate?.addNewSong(song: Song(
                    artist: artist!,
                    name: songTitle!,
                    image: chosenImage!
                )
                )
                
                self?.navigationController?.popViewController(animated: true)
                
            } else {
                self?.eraseAll()
            }
            
        }), for: .touchUpInside)
    }
    
    private func eraseAll() {
        artistTextField.text = ""
        songTitleTextField.text = ""
        chosenImageView.image = UIImage(systemName: "photo")
    }
    
    
    // MARK: - Constraints and Margins
    private func setMainStackViewConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setMainStackViewMargins() {
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    private func setImagePickerStackViewConstraints() {
        NSLayoutConstraint.activate([
            imagePickerStackView.heightAnchor.constraint(equalTo: imagePickerStackView.widthAnchor, multiplier: 1)
        ])
    }
    
    private func setImagePickerStackViewMargins() {
        imagePickerStackView.isLayoutMarginsRelativeArrangement = true
        imagePickerStackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    private func setChooseImageButtonConstraints() {
        chooseImageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setaddSongButtonConstraints() {
        NSLayoutConstraint.activate([
            addSongButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
}


// MARK: - Image Picker Delegate
extension AddNewItemToListViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            self.chosenImageView.image = image
        }
        
        if let image = info[.editedImage] as? UIImage {
            self.chosenImageView.image = image
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
