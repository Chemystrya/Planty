//
//  PlantListViewController.swift
//  Planty
//
//  Created by Fedorova Maria on 23.08.2024.
//

import UIKit

enum PlantListCellType {
    case listingCell(PlantListCellViewModel)
}

protocol PlantListViewInput: AnyObject {
    func reloadTableView(with dataSource: [PlantListCellType])
}

protocol PlantListViewOutput: AnyObject {
    func viewLoaded()
}

final class PlantListViewController: UIViewController {
    var presenter: PlantListViewOutput?

    private var dataSource: [PlantListCellType] = []
    private let tableView = UITableView()
    private let navigationView = NavigationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configure()
        
        tableView.register(PlantListCell.self, forCellReuseIdentifier: "PlantyCell")
        tableView.dataSource = self

        presenter?.viewLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension PlantListViewController: PlantListViewInput {
    func reloadTableView(with dataSource: [PlantListCellType]) {
        self.dataSource = dataSource

        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension PlantListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = dataSource[indexPath.row]

        switch type {
        case .listingCell(let viewModel):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "PlantyCell",
                for: indexPath
            ) as? PlantListCell else { return UITableViewCell() }

            cell.configure(viewModel: viewModel)
            return cell
        }
    }
}

extension PlantListViewController {
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(navigationView)
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 8)
        ])
    }
    
    private func configure() {
        navigationView.configure(title: "Растения")
    }
}
