//
//  TabBarController.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case overview
    case session
    case progress
    case settings
}


final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.tintColor = Resources.Colors.actiy
        tabBar.barTintColor = Resources.Colors.inaActiy
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderColor = Resources.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        //создаем массив Навигейшенов в которые закидываем рутовые контроллеры
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.title(for: tab), image: Resources.Images.TabBar.icon(for: tab), tag: tab.rawValue)
            return controller
        }
        //добавляем полученные контроллеры в Таб бар
        setViewControllers(controllers, animated: false)
    }
    
    //функция которая в зависимости от полученного перечисления создает контроллер
    private func getController(for tab: Tabs) -> BaseController {
        switch tab {
        case .overview:
            return OverviewController()
        case .session:
            return SessionController()
        case .progress:
            return ProgressController()
        case .settings:
            return SettingsController()
        }
    }
}
