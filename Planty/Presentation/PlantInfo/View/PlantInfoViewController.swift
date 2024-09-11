//
//  PlantInfoViewController.swift
//  Planty
//
//  Created by Fedorova Maria on 05.09.2024.
//

import UIKit

enum PlantInfoCellType {
    case image(PlantInfoImageCellViewModel)
    case chips(PlantInfoChipsCollectionViewCellViewModel)
    case label(PlantInfoLabelCellViewModel)
    case careTitle(PlantInfoDescriptionCellViewModel)
    case plantDescription(PlantInfoDescriptionCellViewModel)
}

protocol PlantInfoViewInput: AnyObject {
    func reloadTableView(with dataSource: [PlantInfoCellType])
}

protocol PlantInfoViewOutput: AnyObject {
    func viewLoaded()
}

final class PlantInfoViewController: UIViewController {
    var presenter: PlantInfoViewOutput?

    private var dataSource: [PlantInfoCellType] = []
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()

        tableView.register(
            PlantInfoImageCell.self,
            forCellReuseIdentifier: String(describing: PlantInfoImageCell.self)
        )
        tableView.register(
            PlantInfoLabelCell.self,
            forCellReuseIdentifier: String(describing: PlantInfoLabelCell.self)
        )
        tableView.register(
            PlantInfoDescriptionCell.self,
            forCellReuseIdentifier: String(describing: PlantInfoDescriptionCell.self)
        )
        tableView.register(
            PlantInfoChipsCollectionView.self,
            forCellReuseIdentifier: String(describing: PlantInfoChipsCollectionView.self)
        )

        tableView.dataSource = self

        presenter?.viewLoaded()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension PlantInfoViewController: PlantInfoViewInput {
    func reloadTableView(with dataSource: [PlantInfoCellType]) {
        self.dataSource = dataSource

        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension PlantInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = dataSource[indexPath.row]

        switch type {
        case .image(let viewModel):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: PlantInfoImageCell.self),
                for: indexPath
            ) as? PlantInfoImageCell else { return UITableViewCell() }

            cell.configure(viewModel: viewModel)
            return cell

        case .chips(let viewModel):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: PlantInfoChipsCollectionView.self),
                for: indexPath
            ) as? PlantInfoChipsCollectionView else { return UITableViewCell() }

            cell.configure(viewModel: viewModel)
            return cell
            
        case .label(let viewModel):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: PlantInfoLabelCell.self),
                for: indexPath
            ) as? PlantInfoLabelCell else { return UITableViewCell() }

            cell.configure(viewModel: viewModel)
            return cell
       
        case .careTitle(let viewModel):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(
                    describing: PlantInfoDescriptionCell.self),
                for: indexPath
            ) as? PlantInfoDescriptionCell else { return UITableViewCell() }

            cell.configure(viewModel: viewModel)
            return cell

        case .plantDescription(let viewModel):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(
                    describing: PlantInfoDescriptionCell.self),
                for: indexPath
            ) as? PlantInfoDescriptionCell else { return UITableViewCell() }

            cell.configure(viewModel: viewModel)
            return cell
        }
    }
}

extension PlantInfoViewController {
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.separatorStyle = .none

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
}

