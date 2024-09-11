//
//  PlantInfoChipsCell.swift
//  Planty
//
//  Created by Fedorova Maria on 10.09.2024.
//

import UIKit

struct ChipsViewModel {
    let color: UIColor
    let textColor: UIColor
    let text: String
}

final class ChipsView: UIView {
    private let chipsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = frame.height / 2
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(chipsLabel)

        chipsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chipsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            chipsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            chipsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            chipsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4)
        ])
    }

    func configure(viewModel: ChipsViewModel) {
        chipsLabel.text = viewModel.text
        chipsLabel.textColor = viewModel.textColor
        backgroundColor = viewModel.color
    }
}
