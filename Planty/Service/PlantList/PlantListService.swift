//
//  PlantListService.swift
//  Planty
//
//  Created by Fedorova Maria on 26.08.2024.
//

import Foundation

protocol PlantListService {
    func fetchPlants(completion: @escaping ([Plant]) -> Void)
}

final class PlantListServiceImpl: PlantListService {
    func fetchPlants(completion: @escaping ([Plant]) -> Void) {
        let plants = Plant.createDataSource()

        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            completion(plants)
        }
    }
}
