//
//  NavBarController.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit

final class NavBarController : UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false //будет окрашиваться все и статус бар
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resources.Colors.titleGray,
            .font: Resources.Founts.helvelticaRegular(with: 17)
        ]
        navigationBar.addBottomBorder(color: Resources.Colors.separator, height: 1)
    }
}
