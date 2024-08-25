//
//  PlantyCell.swift
//  Planty
//
//  Created by Fedorova Maria on 23.08.2024.
//

import UIKit

class PlantyCell: UITableViewCell {

   let imagePlant = UIImageView()
	let nameLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 16)
		return label
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupCell()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupCell() {
		contentView.addSubview(imagePlant)
		contentView.addSubview(nameLabel)

		imagePlant.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			imagePlant.topAnchor.constraint(equalTo: contentView.topAnchor),
			imagePlant.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			imagePlant.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			imagePlant.heightAnchor.constraint(equalToConstant: 48),
			imagePlant.widthAnchor.constraint(equalToConstant: 48)
		])

		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			nameLabel.leadingAnchor.constraint(equalTo: imagePlant.trailingAnchor, constant: 16),
			nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
			nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
			nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27)
		])
	}
// конфигурирует 1 ячейку
	func configureCell(plant: Plant) {
		imagePlant.image = plant.image
		nameLabel.text = plant.name
	}

}
