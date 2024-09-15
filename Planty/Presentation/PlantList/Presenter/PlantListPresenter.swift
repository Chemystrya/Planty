//
//  PlantListPresenter.swift
//  Planty
//
//  Created by Fedorova Maria on 01.09.2024.
//

import Foundation
import UIKit

final class PlantListPresenter {
    private weak var view: PlantListViewInput?
    
    private let interactor: PlantListInteractorInput
    private let router: PlantListRouterInput
    private var plants: [Plant]?

    init(
        view: PlantListViewInput?,
        interactor: PlantListInteractorInput,
        router: PlantListRouterInput
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension PlantListPresenter: PlantListViewOutput {
    func viewLoaded() {
        interactor.loadPlant()
    }

    func cellTapped(with plantCell: PlantListCellType) {
        let name: String? = switch plantCell {
        case .listingCell(let viewModel):
            viewModel.name
        }

        guard let plant = plants?.first(where: { $0.name == name }) else { return }

        router.openPlantInfoScreen(with: PlantInfoInputModel(id: plant.id))
    }
}

extension PlantListPresenter: PlantListInteractorOutput {
    func plantsLoaded(plants: [Plant]) {
        self.plants = plants

        var dataSource: [PlantListCellType] = []

        plants.forEach { plant in
            dataSource.append(
                PlantListCellType.listingCell(PlantListCellViewModel(image: plant.image, name: plant.name))
            )
        }

        view?.reloadTableView(with: dataSource)
    }
}
