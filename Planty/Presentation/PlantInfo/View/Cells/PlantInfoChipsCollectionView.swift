//
//  PlantInfoChipsCollectionView.swift
//  Planty
//
//  Created by Fedorova Maria on 10.09.2024.
//

import UIKit

struct PlantInfoChipsCollectionViewCellViewModel {
    let chipsViewModels: [ChipsViewModel]
}

final class PlantInfoChipsCollectionView: UITableViewCell {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 200, height: 28)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private var dataSource: [ChipsViewModel] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        collectionView.dataSource = self
        collectionView.register(
            PlantInfoChipsCollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: PlantInfoChipsCollectionViewCell.self)
        )

        contentView.addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    func configure(viewModel: PlantInfoChipsCollectionViewCellViewModel) {
        dataSource = viewModel.chipsViewModels
        collectionView.reloadData()
    }
}

extension PlantInfoChipsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = dataSource[indexPath.row]

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: PlantInfoChipsCollectionViewCell.self),
            for: indexPath
        ) as? PlantInfoChipsCollectionViewCell else { return UICollectionViewCell() }

        cell.configure(viewModel: viewModel)
        return cell
    }
}
