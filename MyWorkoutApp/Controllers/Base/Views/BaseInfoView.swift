//
//  BaseInfoView.swift
//  MyWorkoutApp
//
//  Created by Kirill on 04.09.2023.
//

import UIKit

class BaseInfoView: BaseView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Founts.helvelticaRegular(with: 13)
        label.textColor = Resources.Colors.inaActiy
        return label
    }()
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = Resources.Colors.separator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let button = SecondaryButton(with: .primary)
    
    
    //кастомный инициализатор
    init(with title: String? = nil, buttonTitle: String? = nil) {
        titleLabel.text = title
        titleLabel.textAlignment = buttonTitle == nil ? .center : .left
        button.setTitle(buttonTitle)
        button.isHidden = buttonTitle == nil ? true : false
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtonTarget(target: Any?, action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
}

extension BaseInfoView {
    override func setupViews() {
        super.setupViews()
        addView(contentView)
        addView(titleLabel)
        addView(button)
    }
    
    override func setupLayoutViews() {
        super.setupLayoutViews()
        //если текста нет - тогда контент прикрепрелн к верхней границы view
        //если текст есть - то к нему
        let contentTopAnchor: NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
        //если текста нет - тогда отступ от границы 0
        //если текст есть - тогда отступ 10
        let contentTopOffset: CGFloat = titleLabel.text == nil ? 0 : 10
        
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 130),
            button.heightAnchor.constraint(equalToConstant: 28),
            
            contentView.topAnchor.constraint(equalTo: contentTopAnchor, constant: contentTopOffset),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}
