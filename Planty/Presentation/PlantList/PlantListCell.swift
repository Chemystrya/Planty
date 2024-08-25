//
//  PlantListCell.swift
//  Planty
//
//  Created by Fedorova Maria on 23.08.2024.
//

import UIKit

final class PlantListCell: UITableViewCell {
    let containerView = UIView()
    let imagePlant = UIImageView()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(containerView)
        containerView.addSubview(imagePlant)
        containerView.addSubview(nameLabel)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        imagePlant.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagePlant.topAnchor.constraint(equalTo: containerView.topAnchor),
            imagePlant.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            imagePlant.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imagePlant.heightAnchor.constraint(equalToConstant: 48),
            imagePlant.widthAnchor.constraint(equalToConstant: 48)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 14),
            nameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -14),
            nameLabel.leadingAnchor.constraint(equalTo: imagePlant.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    // конфигурирует ячейку
    func configure(plant: Plant) {
        imagePlant.image = plant.image
        nameLabel.text = plant.name
    }
}
