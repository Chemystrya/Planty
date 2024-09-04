//
//  PlantListInteractor.swift
//  Planty
//
//  Created by Fedorova Maria on 01.09.2024.
//

import Foundation

protocol PlantListInteractorInput {
    func loadPlant()
}

protocol PlantListInteractorOutput: AnyObject {
    func plantsLoaded(plants: [Plant])
}

final class PlantListInteractor {
    weak var presenter: PlantListInteractorOutput?
    
    private let plantListService: PlantListService

    init(plantListService: PlantListService) {
        self.plantListService = plantListService
    }
}

extension PlantListInteractor: PlantListInteractorInput {
    func loadPlant() {
        plantListService.fetchPlants { [weak self] plants in
            self?.presenter?.plantsLoaded(plants: plants)
        }
    }
}
