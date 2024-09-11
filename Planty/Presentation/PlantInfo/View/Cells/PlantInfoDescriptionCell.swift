//
//  PlantInfoDescriptionCell.swift
//  Planty
//
//  Created by Fedorova Maria on 06.09.2024.
//

import UIKit

struct PlantInfoDescriptionCellViewModel {
    let plantTitle: String
    let plantDescription: String
}

final class PlantInfoDescriptionCell: UITableViewCell {
    private let plantTitleView: UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 14)
        return title
    }()
    private let plantDescriptionView: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 16)
        return description
    }()

    private let font = UIFont.systemFont(ofSize: 16)
    private let boldFont = UIFont.boldSystemFont(ofSize: 16)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(plantTitleView)
        contentView.addSubview(plantDescriptionView)

        plantTitleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plantTitleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            plantTitleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            plantTitleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        ])

        plantDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plantDescriptionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            plantDescriptionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            plantDescriptionView.topAnchor.constraint(equalTo: plantTitleView.bottomAnchor, constant: 12),
            plantDescriptionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        plantTitleView.numberOfLines = 0
        plantDescriptionView.numberOfLines = 0
    }

    func configure(viewModel: PlantInfoDescriptionCellViewModel) {
        plantTitleView.text = viewModel.plantTitle
        plantDescriptionView.attributedText = viewModel.plantDescription.withBoldText(
            boldPartsOfString: boldStrings,
            font: font,
            boldFont: boldFont
        )
    }
}

extension PlantInfoDescriptionCell {
    private var boldStrings: [NSString] {
        [
            "Температура.",
            "Освещение.",
            "Полив.",
            "Грунт.",
            "Подкормка.",
            "Кашпо.",
            "Пересадка.",
            "Размножение.",
            "Вредители."
        ]
    }
}
