//
//  CustomTableViewCell.swift
//  Assignment_13
//
//  Created by Macbook Air 13 on 30.10.23.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 8, left: 16, bottom: 8, right: 16)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let songImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.circle.fill")
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        addSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PrepareForReuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        songImageView.image = nil
        nameLabel.text = nil
    }
    
    // MARK: - Configure
    func configure(with model: Song) {
        songImageView.image = UIImage(named: model.imageName)
        nameLabel.text = model.name
    }
    
    // MARK: - Private Methods
    private func addSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(songImageView)
        mainStackView.addArrangedSubview(nameLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            mainStackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            songImageView.widthAnchor.constraint(equalToConstant: 60),
            songImageView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
