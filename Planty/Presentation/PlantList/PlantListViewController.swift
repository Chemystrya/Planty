//
//  PlantListViewController.swift
//  Planty
//
//  Created by Fedorova Maria on 23.08.2024.
//

import UIKit

class PlantListViewController: UIViewController {

	private let plants = Plant.createDataSource()
	private let tableView = UITableView()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupTableView()
		tableView.register(PlantyCell.self, forCellReuseIdentifier: "PlantyCell")

		tableView.dataSource = self
		tableView.delegate = self
	}
}


extension PlantListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		plants.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlantyCell", for: indexPath) as? PlantyCell
		else { fatalError() }
		cell.configureCell(plant: plants[indexPath.row])
		return cell
	}
}

extension PlantListViewController: UITableViewDelegate {

}

extension PlantListViewController {
	func setupTableView() {
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			tableView.topAnchor.constraint(equalTo: view.topAnchor)
		])
	}
}
