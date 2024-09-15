//
//  TransitionHandler.swift
//  Planty
//
//  Created by Fedorova Maria on 12.09.2024.
//

import UIKit

protocol TransitionHandler: AnyObject {
    func pushModule(with viewController: UIViewController, hidesTabBarWhenPushed: Bool)
    func back()
}

extension UIViewController: TransitionHandler {
    func pushModule(with viewController: UIViewController, hidesTabBarWhenPushed: Bool) {
        viewController.hidesBottomBarWhenPushed = hidesTabBarWhenPushed
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func back() {
        guard let navigationController else {
            dismiss(animated: true)
            return
        }

        if navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: true)
        } else {
            navigationController.dismiss(animated: true)
        }
    }
}
