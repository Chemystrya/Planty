//
//  PlantInfoAssembly.swift
//  Planty
//
//  Created by Fedorova Maria on 05.09.2024.
//

import UIKit

struct PlantInfoInputModel {
    let id: Int
}

final class PlantInfoAssembly {
    static func assemble(with inputModel: PlantInfoInputModel) -> UIViewController {
        let service: PlantInfoService = PlantInfoServiceImpl()
        let interactor = PlantInfoInteractor(plantInfoService: service)
        let view = PlantInfoViewController()
        let presenter = PlantInfoPresenter(view: view, interactor: interactor, inputModel: inputModel)
        interactor.presenter = presenter
        view.presenter = presenter

        return view
    }
}
