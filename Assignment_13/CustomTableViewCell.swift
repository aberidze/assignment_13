//
//  CustomTableViewCell.swift
//  Assignment_13
//
//  Created by Macbook Air 13 on 30.10.23.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private let cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 15
        
        return stackView
    }()
    
    private let songImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    private let songTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 17.0)
        label.numberOfLines = 1
        
        return label
    }()
    
    var song: Song?
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellStackView()
        fillStackView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Configure
    func configure(song: Song) {
        songImageView.image = song.image
        songTitle.text = "\(song.artist) _ \(song.name)"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        selectionStyle = .none
        songImageView.image = nil
        songTitle.text = nil
    }
    
    
    // MARK: - Private Methods
    private func setupCellStackView() {
        addSubview(cellStackView)
        setCellStackViewConstraints()
        setCellStackViewMargins()
    }
    
    private func fillStackView() {
        cellStackView.addArrangedSubview(songImageView)
        cellStackView.addArrangedSubview(songTitle)
        setSongImageViewConstraints()
    }
    
    
    // MARK: - Constraints and Margins
    private func setCellStackViewConstraints() {
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: self.topAnchor),
            cellStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cellStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func setCellStackViewMargins() {
        cellStackView.isLayoutMarginsRelativeArrangement = true
        cellStackView.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    private func setSongImageViewConstraints() {
        NSLayoutConstraint.activate([
            songImageView.heightAnchor.constraint(equalToConstant: 50),
            songImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
