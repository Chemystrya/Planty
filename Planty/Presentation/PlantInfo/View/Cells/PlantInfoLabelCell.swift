//
//  PlantInfoLabelCell.swift
//  Planty
//
//  Created by Fedorova Maria on 05.09.2024.
//

import UIKit

struct PlantInfoLabelCellViewModel {
    let label: String
}

final class PlantInfoLabelCell: UITableViewCell {
    let plantLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
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
        contentView.addSubview(plantLabelView)

        plantLabelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plantLabelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            plantLabelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            plantLabelView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            plantLabelView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])

    }

    func configure(viewModel: PlantInfoLabelCellViewModel) {
        plantLabelView.text = viewModel.label
    }
}
