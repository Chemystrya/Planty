//
//  PlantInfoService.swift
//  Planty
//
//  Created by Fedorova Maria on 05.09.2024.
//

import Foundation

protocol PlantInfoService {
    func fetchPlants(id: Int, completion: @escaping (Plant?) -> Void)
}

final class PlantInfoServiceImpl: PlantInfoService {
    func fetchPlants(id: Int, completion: @escaping (Plant?) -> Void) {
        let plants = Plant.createDataSource()
        let plant = plants.first(where: { $0.id == id})

        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            completion(plant)
        }
    }
}
