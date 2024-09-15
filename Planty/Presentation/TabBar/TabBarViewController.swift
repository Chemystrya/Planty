//
//  TabBarViewController.swift
//  Planty
//
//  Created by Fedorova Maria on 11.09.2024.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray

        setTabs()

        tabBar.tintColor = .greenColorText
        tabBar.backgroundColor = .colorForTabBar
    }

    private func setTabs() {
        let searchNavigationController = UINavigationController()
        let searchViewController = PlantListAssembly.assemble()
        setupTab(
            viewController: searchViewController,
            title: "Search",
            image: UIImage(systemName: "magnifyingglass.circle"),
            selectedImage: UIImage(systemName: "magnifyingglass.circle.fill")
        )
        searchNavigationController.viewControllers = [searchViewController]

        let shelfViewController = ShelfViewController()
        setupTab(
            viewController: shelfViewController,
            title: "Shelf",
            image: UIImage(systemName: "leaf.circle"),
            selectedImage: UIImage(systemName: "leaf.circle.fill")
        )

        let profileViewController = ProfileViewController()
        setupTab(
            viewController: profileViewController,
            title: "Profile",
            image: UIImage(systemName: "person.crop.circle"),
            selectedImage: UIImage(systemName: "person.crop.circle.fill")
        )

        let viewControllers = [searchNavigationController, shelfViewController, profileViewController]

        setViewControllers(viewControllers, animated: false)
    }

    private func setupTab(
        viewController: UIViewController,
        title: String,
        image: UIImage?,
        selectedImage: UIImage?
    ) {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectedImage
    }
}
