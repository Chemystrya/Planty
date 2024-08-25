//
//  Plant.swift
//  Planty
//
//  Created by Fedorova Maria on 23.08.2024.
//

import UIKit

struct Plant {
    let name: String
    let image: UIImage?
    
    static func createDataSource() -> [Plant] {
        [
            Plant(name: "Аглаонема Мария", image: UIImage(named: "aglaonemaMaria")),
            Plant(name: "Антуриум Блэк", image: UIImage(named: "anthuriumBlack")),
            Plant(name: "Антуриум Карма", image: UIImage(named: "anthuriumKarma")),
            Plant(name: "Антуриум Лилли", image: UIImage(named: "anthuriumLilly")),
            Plant(name: "Араукария", image: UIImage(named: "araucaria")),
            Plant(name: "Аспидистра Элатиор", image: UIImage(named: "aspidistraElatior")),
            Plant(name: "Драцена Джанет Кейг", image: UIImage(named: "dracenaJanetCraig")),
            Plant(name: "Фикус Бенджамина", image: UIImage(named: "ficusBendjamina")),
            Plant(name: "Фикус Эластика Мелини", image: UIImage(named: "ficusElasticaMelanie")),
            Plant(name: "Фикус Лирата", image: UIImage(named: "ficusLirata")),
            Plant(name: "Монстера Минима", image: UIImage(named: "monsteraMinima")),
            Plant(name: "Монстера Монки Маск", image: UIImage(named: "monsteraMonkeyMask")),
            Plant(name: "Сансевиерия Цилиндрика", image: UIImage(named: "sansevieriaCylindrica")),
            Plant(name: "Сансевиерия Цилинрика Коса", image: UIImage(named: "sansevieriaCylindricaKosa")),
            Plant(name: "Шеффлера Герда", image: UIImage(named: "scheffleraGerda"))
        ]
    }
}

