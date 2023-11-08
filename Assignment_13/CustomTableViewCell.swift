//
//  CustomTableViewCell.swift
//  Assignment_13
//
//  Created by Macbook Air 13 on 30.10.23.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
