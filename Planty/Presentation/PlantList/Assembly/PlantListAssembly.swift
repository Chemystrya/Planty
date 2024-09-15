//
//  PlantListAssembly.swift
//  Planty
//
//  Created by Fedorova Maria on 01.09.2024.
//

import UIKit

final class PlantListAssembly {
    static func assemble() -> UIViewController {
        let service: PlantListService = PlantListServiceImpl()
        let interactor = PlantListInteractor(plantListService: service)
        let view = PlantListViewController()
        let router = PlantListRouter()
        router.transitionHandler = view
        let presenter = PlantListPresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        view.presenter = presenter

        return view
    }
}
