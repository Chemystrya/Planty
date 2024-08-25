//
//  PlantListViewController.swift
//  Planty
//
//  Created by Fedorova Maria on 23.08.2024.
//

import UIKit

final class PlantListViewController: UIViewController {
    private let plants = Plant.createDataSource()
    private let tableView = UITableView()
    private let navigationView = NavigationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configure()
        
        tableView.register(PlantListCell.self, forCellReuseIdentifier: "PlantyCell")
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

extension PlantListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        plants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlantyCell", for: indexPath) as? PlantListCell else { 
            return UITableViewCell()
        }
        
        cell.configure(plant: plants[indexPath.row])
        return cell
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
            tableView.topAnchor.constraint(equalTo: navigationView.bottomAnchor)
        ])
    }
    
    private func configure() {
        navigationView.configure(title: "Растения")
    }
}
