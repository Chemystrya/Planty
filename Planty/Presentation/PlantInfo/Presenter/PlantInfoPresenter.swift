//
//  PlantInfoPresenter.swift
//  Planty
//
//  Created by Fedorova Maria on 05.09.2024.
//

import Foundation
import UIKit

final class PlantInfoPresenter {
    private weak var view: PlantInfoViewInput?

    private let interactor: PlantInfoInteractorInput
    private let factory: PlantInfoFactory
    private let router: PlantInfoRouter
    private let inputModel: PlantInfoInputModel

    init(
        view: PlantInfoViewInput?,
        interactor: PlantInfoInteractorInput,
        factory: PlantInfoFactory,
        router: PlantInfoRouter,
        inputModel: PlantInfoInputModel
    ) {
        self.view = view
        self.interactor = interactor
        self.factory = factory
        self.router = router
        self.inputModel = inputModel
    }
}

extension PlantInfoPresenter: PlantInfoViewOutput {
    func viewLoaded() {
        interactor.loadPlant(id: inputModel.id)
    }
}

extension PlantInfoPresenter: PlantInfoInteractorOutput {
    func plantLoaded(plant: Plant) {
        let dataSource = factory.create(with: plant)
        let navigationViewModel = factory.createNavigationViewModel()

        view?.reloadTableView(with: dataSource)
        view?.updateNavigationView(with: navigationViewModel)
    }
}

extension PlantInfoPresenter: NavigationViewDelegate {
    func backButtonTapped() {
        router.back()
    }
}
