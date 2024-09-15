//
//  PlantInfoFactory.swift
//  Planty
//
//  Created by Fedorova Maria on 15.09.2024.
//

import Foundation

protocol PlantInfoFactory {
    func create(with plant: Plant) -> [PlantInfoCellType]
    func createNavigationViewModel() -> NavigationViewModel
}

final class PlantInfoFactoryImpl: PlantInfoFactory {
    weak var navigationViewDelegate: NavigationViewDelegate?

    func create(with plant: Plant) -> [PlantInfoCellType] {
        var dataSource: [PlantInfoCellType] = []

        let imageCellViewModel = PlantInfoImageCellViewModel(image: plant.image)
        let imageCell = PlantInfoCellType.image(imageCellViewModel)
        let labelCellViewModel = PlantInfoLabelCellViewModel(label: plant.name)
        let labelCell = PlantInfoCellType.label(labelCellViewModel)
        let descriptionCellViewModel = PlantInfoDescriptionCellViewModel(
            plantTitle: "ОПИСАНИЕ",
            plantDescription: plant.description
        )
        let descriptionCell = PlantInfoCellType.careTitle(descriptionCellViewModel)
        let careCellViewModel = PlantInfoDescriptionCellViewModel(
            plantTitle: "УХОД",
            plantDescription: plant.plantCare
        )
        let careCell = PlantInfoCellType.careTitle(careCellViewModel)
        let chipsViewModels = plant.properties.map { property in
            ChipsViewModel(
                color: property.additionalInfo.color,
                textColor: property.additionalInfo.textColor,
                text: property.rawValue
            )
        }
        let chipsCellViewModel = PlantInfoChipsCollectionViewCellViewModel(chipsViewModels: chipsViewModels)
        let chipsCell = PlantInfoCellType.chips(chipsCellViewModel)

        dataSource.append(imageCell)
        dataSource.append(labelCell)
        dataSource.append(chipsCell)
        dataSource.append(descriptionCell)
        dataSource.append(careCell)

        return dataSource
    }

    func createNavigationViewModel() -> NavigationViewModel {
        NavigationViewModel(title: nil, backgroundColor: .clear, delegate: navigationViewDelegate)
    }
}
