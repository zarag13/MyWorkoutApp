//
//  BaseController.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureAppearance()
        setupLayoutViews()
    }
}

@objc extension BaseController {
    func setupViews() {}
    
    func setupLayoutViews() {}
    
    func configureAppearance() {
        view.backgroundColor = Resources.Colors.backgroundViews
    }
    
    func navBarLeftButtonHendler() {}
    
    func navBarRightButtonHendler() {}
}

extension BaseController {
    //в каком контролле используем - там и создаются кнопки на навигейшен баре
    func addNavBarButton(position: NavBarPosition, title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resources.Colors.actiy, for: .normal)
        button.setTitleColor(Resources.Colors.inaActiy, for: .disabled)
        button.titleLabel?.font = Resources.Founts.helvelticaRegular(with: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHendler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHendler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
