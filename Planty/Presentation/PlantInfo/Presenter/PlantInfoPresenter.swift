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
    private let inputModel: PlantInfoInputModel

    init(view: PlantInfoViewInput?, interactor: PlantInfoInteractorInput, inputModel: PlantInfoInputModel) {
        self.view = view
        self.interactor = interactor
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
        var dataSource: [PlantInfoCellType] = []

        let imageCellViewModel = PlantInfoImageCellViewModel(image: plant.image)
        let imageCell = PlantInfoCellType.image(imageCellViewModel)
        let labelCellViewModel = PlantInfoLabelCellViewModel(label: plant.name)
        let labelCell = PlantInfoCellType.label(labelCellViewModel)
        let descriptionCellViewModel = PlantInfoDescriptionCellViewModel(plantTitle: "ОПИСАНИЕ", plantDescription: plant.description)
        let descriptionCell = PlantInfoCellType.careTitle(descriptionCellViewModel)
        let careCellViewModel = PlantInfoDescriptionCellViewModel(plantTitle: "УХОД", plantDescription: plant.plantCare)
        let careCell = PlantInfoCellType.careTitle(careCellViewModel)
        let chipsViewModels = plant.properties.map { property in
            ChipsViewModel(color: property.additionalInfo.color, textColor: property.additionalInfo.textColor, text: property.rawValue)
        }
        let chipsCellViewModel = PlantInfoChipsCollectionViewCellViewModel(chipsViewModels: chipsViewModels)
        let chipsCell = PlantInfoCellType.chips(chipsCellViewModel)

        dataSource.append(imageCell)
        dataSource.append(labelCell)
        dataSource.append(chipsCell)
        dataSource.append(descriptionCell)
        dataSource.append(careCell)

        view?.reloadTableView(with: dataSource)
    }
}
