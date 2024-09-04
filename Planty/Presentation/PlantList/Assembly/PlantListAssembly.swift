//
//  PlantListAssembly.swift
//  Planty
//
//  Created by Fedorova Maria on 01.09.2024.
//

import UIKit

final class PlantListAssembly {
    func assemble() -> UIViewController {
        let service: PlantListService = PlantListServiceImpl()
        let interactor = PlantListInteractor(plantListService: service)
        let view = PlantListViewController()
        let presenter = PlantListPresenter(view: view, interactor: interactor)
        interactor.presenter = presenter
        view.presenter = presenter

        return view
    }
}
