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
			Plant(name: "Adobe Hot Pepper", image: UIImage(named: "adobeHotPepper")),
			Plant(name: "Aglaonema Spring", image: UIImage(named: "aglaonemaSpring")),
			Plant(name: "Bamboo Palm", image: UIImage(named: "bambooPalm")),
			Plant(name: "Bird of Paradise", image: UIImage(named: "birdOfParadise")),
			Plant(name: "Bromeliad Pineapple", image: UIImage(named: "bromeliadPineapple")),
			Plant(name: "Bromeliad Summer", image: UIImage(named: "bromeliadSummer")),
			Plant(name: "Cat Grass", image: UIImage(named: "catGrass")),
			Plant(name: "Catnip", image: UIImage(named: "catnip")),
			Plant(name: "Chamomile", image: UIImage(named: "chamomile")),
			Plant(name: "Coconut Palm", image: UIImage(named: "coconutPalm"))
		]
	}
}

