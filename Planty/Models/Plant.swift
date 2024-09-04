//
//  Plant.swift
//  Planty
//
//  Created by Fedorova Maria on 23.08.2024.
//

import UIKit

struct Plant {
    let id: Int
    let name: String
    let image: UIImage?
    
    static func createDataSource() -> [Plant] {
        [
            Plant(id: 1, name: "Аглаонема Мария", image: UIImage(named: "aglaonemaMaria")),
            Plant(id: 2, name: "Антуриум Блэк", image: UIImage(named: "anthuriumBlack")),
            Plant(id: 3, name: "Антуриум Карма", image: UIImage(named: "anthuriumKarma")),
            Plant(id: 4, name: "Антуриум Лилли", image: UIImage(named: "anthuriumLilly")),
            Plant(id: 5, name: "Араукария", image: UIImage(named: "araucaria")),
            Plant(id: 6, name: "Аспидистра Элатиор", image: UIImage(named: "aspidistraElatior")),
            Plant(id: 7, name: "Драцена Джанет Кейг", image: UIImage(named: "dracenaJanetCraig")),
            Plant(id: 8, name: "Фикус Бенджамина", image: UIImage(named: "ficusBendjamina")),
            Plant(id: 9, name: "Фикус Эластика Мелини", image: UIImage(named: "ficusElasticaMelanie")),
            Plant(id: 10, name: "Фикус Лирата", image: UIImage(named: "ficusLirata")),
            Plant(id: 11, name: "Монстера Минима", image: UIImage(named: "monsteraMinima")),
            Plant(id: 12, name: "Монстера Монки Маск", image: UIImage(named: "monsteraMonkeyMask")),
            Plant(id: 13, name: "Сансевиерия Цилиндрика", image: UIImage(named: "sansevieriaCylindrica")),
            Plant(id: 14, name: "Сансевиерия Цилинрика Коса", image: UIImage(named: "sansevieriaCylindricaKosa")),
            Plant(id: 15, name: "Шеффлера Герда", image: UIImage(named: "scheffleraGerda"))
        ]
    }
}

