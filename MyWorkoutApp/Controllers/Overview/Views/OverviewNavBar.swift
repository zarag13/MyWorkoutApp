//
//  OverviewNavBar.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit

final class OverviewNavBar: BaseView {
    
    private let titleLabel = UILabel()
    
    private let allWorkoutsButton: SecondaryButton = {
        var button = SecondaryButton(with: .secondary)
        button.setTitle(Resources.Strings.Overview.allWorcoutsButton)
        return button
    }()
    
    private let addButton = UIButton()
    
    private let weakView = WeakView()
    
    //где будем использовать кастомный бар - что бы можно было создать Экшены для кнопок в том контроллере
    func addAllWorkoutsAction( _ action: Selector, with target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
    func addAditingAction( _ action: Selector, with target: Any?) {
        allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //когда уже будет известен размер Бара - добавляем на него сепаратор - разделающий бар и основное view
        addBottomBorder(color: Resources.Colors.separator, height: 1)
    }
}


extension OverviewNavBar {
    override func setupViews() {
        super.setupViews()
        addView(allWorkoutsButton)
        addView(titleLabel)
        addView(addButton)
        addView(weakView)
    }
    
    override func setupLayoutViews() {
        super.setupLayoutViews()
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint (equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutsButton.trailingAnchor.constraint (equalTo: addButton.leadingAnchor, constant: -15),
            
            titleLabel.centerYAnchor.constraint (equalTo: allWorkoutsButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weakView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weakView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weakView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weakView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weakView.heightAnchor.constraint(equalToConstant: 47),
            
            ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
        
        titleLabel.text = Resources.Strings.NavBar.overview
        titleLabel.textColor = Resources.Colors.titleGray
        titleLabel.font = Resources.Founts.helvelticaRegular(with: 22)
        
        addButton.setImage(Resources.Images.Common.add, for: .normal)
    }
}
