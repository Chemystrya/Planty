//
//  PlantInfoChipsCollectionViewCell.swift
//  Planty
//
//  Created by Fedorova Maria on 10.09.2024.
//

import UIKit

final class PlantInfoChipsCollectionViewCell: UICollectionViewCell {
    private let chipsView = ChipsView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(chipsView)

        chipsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chipsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            chipsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            chipsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            chipsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    func configure(viewModel: ChipsViewModel) {
        chipsView.configure(viewModel: viewModel)
    }
}
