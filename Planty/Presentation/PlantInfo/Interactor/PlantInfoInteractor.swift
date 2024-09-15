//
//  PlantInfoInteractor.swift
//  Planty
//
//  Created by Fedorova Maria on 05.09.2024.
//

import Foundation

protocol PlantInfoInteractorInput {
    func loadPlant(id: Int)
}

protocol PlantInfoInteractorOutput: AnyObject {
    func plantLoaded(plant: Plant)
}

final class PlantInfoInteractor {
    weak var presenter: PlantInfoInteractorOutput?

    private let plantInfoService: PlantInfoService

    init(plantInfoService: PlantInfoService) {
        self.plantInfoService = plantInfoService
    }
}

extension PlantInfoInteractor: PlantInfoInteractorInput {
    func loadPlant(id: Int) {
        plantInfoService.fetchPlants(id: id) { [weak self] plant in
            guard let plant else { return }
            
            self?.presenter?.plantLoaded(plant: plant)
        }
    }
}
