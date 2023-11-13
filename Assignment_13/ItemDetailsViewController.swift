//
//  ItemDetailsViewController.swift
//  Assignment_13
//
//  Created by Macbook Air 13 on 30.10.23.
//

import UIKit

final class ItemDetailsViewController: UIViewController {

    // MARK: - Properties
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .systemGray6
        stackView.distribution = .fill
        stackView.spacing = 15
        
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 20
        
        return stackView
    }()
    
    private let songImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    private let artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 25.0)
        label.numberOfLines = 0
        
        return label
    }()
    
    private let songTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 18.0)
        label.numberOfLines = 0
        
        return label
    }()
    

    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - Configure
    func configure(song: Song) {
        songImageView.image = song.image
        artistLabel.text = song.artist
        songTitle.text = song.name
    }
    
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .white
        setupMainStackView()
        setupNavigationBar()
    }
    
    private func setupMainStackView() {
        view.addSubview(mainStackView)
        setMainStackViewConstraints()
        setMainStackViewMargins()
        fillMainStackView()
    }
    
    private func fillMainStackView() {
        mainStackView.addArrangedSubview(songImageView)
        setSongImageViewConstraints()
        mainStackView.addArrangedSubview(artistLabel)
        mainStackView.setCustomSpacing(5, after: artistLabel)
        mainStackView.addArrangedSubview(songTitle)
    }
    
    private func setupNavigationBar() {
        setupBarTitle()
    }
    
    private func setupBarTitle() {
        self.navigationItem.title = "Favorites"
    }
    
    
    // MARK: - Constraints and Margins
    private func setMainStackViewConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    private func setMainStackViewMargins() {
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 30, right: 10)
    }
    
    private func setSongImageViewConstraints() {
        NSLayoutConstraint.activate([
            songImageView.heightAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 1)
        ])
    }
}
