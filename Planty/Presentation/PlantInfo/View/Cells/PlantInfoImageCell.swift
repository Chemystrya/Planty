//
//  PlantInfoImageCell.swift
//  Planty
//
//  Created by Fedorova Maria on 04.09.2024.
//

import UIKit

struct PlantInfoImageCellViewModel {
    let image: UIImage?
}

final class PlantInfoImageCell: UITableViewCell {
    private let plantImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        contentView.addSubview(plantImageView)
        plantImageView.contentMode = .scaleAspectFit

        plantImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plantImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            plantImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            plantImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            plantImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            plantImageView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }

    func configure(viewModel: PlantInfoImageCellViewModel) {
        plantImageView.image = viewModel.image
    }
}

#Preview {
    let cell = PlantInfoImageCell()
    cell.configure(
        viewModel: PlantInfoImageCellViewModel(image: UIImage(named: "aglaonemaMaria"))
    )
    return cell
}
