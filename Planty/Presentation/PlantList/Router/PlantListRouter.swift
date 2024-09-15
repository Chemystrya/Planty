//
//  PlantListRouter.swift
//  Planty
//
//  Created by Fedorova Maria on 12.09.2024.
//

import Foundation

protocol PlantListRouterInput {
    func openPlantInfoScreen(with inputModel: PlantInfoInputModel)
}

final class PlantListRouter: BaseRouter, PlantListRouterInput {
    func openPlantInfoScreen(with inputModel: PlantInfoInputModel) {
        let viewController = PlantInfoAssembly.assemble(with: inputModel)
        transitionHandler?.pushModule(with: viewController, hidesTabBarWhenPushed: true)
    }
}
