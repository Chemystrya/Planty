//
//  NavigationView.swift
//  Planty
//
//  Created by Fedorova Maria on 25.08.2024.
//

import UIKit

protocol NavigationViewDelegate: AnyObject {
    func backButtonTapped()
}

struct NavigationViewModel {
    let title: String?
    let backgroundColor: UIColor
    weak var delegate: NavigationViewDelegate?
}

final class NavigationView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .black
        button.imageEdgeInsets = UIEdgeInsets(top: -8, left: -8, bottom: -8, right: -8)
        return button
    }()

    weak var delegate: NavigationViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(backButton)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        ])

        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 32),
            backButton.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    func configure(viewModel: NavigationViewModel) {
        if let title = viewModel.title {
            titleLabel.text = title
        }
        

        delegate = viewModel.delegate
        
        backButton.isHidden = viewModel.delegate == nil
        backButton.addAction(UIAction(handler: { [weak self] _ in
            self?.delegate?.backButtonTapped()
        }), for: .touchUpInside)

        backgroundColor = viewModel.backgroundColor
    }
}
