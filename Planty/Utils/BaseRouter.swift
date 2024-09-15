//
//  BaseRouter.swift
//  Planty
//
//  Created by Fedorova Maria on 12.09.2024.
//

import Foundation

protocol ModuleDismissable: AnyObject {
    func back()
}

class BaseRouter: ModuleDismissable {
    weak var transitionHandler: TransitionHandler?

    func back() {
        transitionHandler?.back()
    }
}
