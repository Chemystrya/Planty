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

    init(view: PlantListViewInput?, interactor: PlantListInteractorInput) {
        self.view = view
        self.interactor = interactor
    }
}

extension PlantListPresenter: PlantListViewOutput {
    func viewLoaded() {
        interactor.loadPlant()
    }
}

extension PlantListPresenter: PlantListInteractorOutput {
    func plantsLoaded(plants: [Plant]) {
        var dataSource: [PlantListCellType] = []

        plants.forEach { plant in
            dataSource.append(
                PlantListCellType.listingCell(PlantListCellViewModel(image: plant.image, name: plant.name))
            )
        }

        view?.reloadTableView(with: dataSource)
    }
}
