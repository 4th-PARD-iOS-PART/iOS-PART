//
//  DemoCell.swift
//  TableView
//
//  Created by 김하람 on 2023/09/29.
//

import UIKit

class DemoCell: UITableViewCell {
    let image = UIImageView()
    let label = UILabel()
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Cell")
        contentView.addSubview(label)
        contentView.addSubview(image)
    }
    
    func setLabel(){
        label.translatesAutoresizingMaskIntoConstraints = false
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
}
